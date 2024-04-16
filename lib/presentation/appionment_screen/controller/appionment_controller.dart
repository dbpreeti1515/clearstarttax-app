import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/appionment_screen/models/appionment_model.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../api_constant/api_constant.dart';
import '../../../core/http_methods/http_methods.dart';
import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getDashboardModal.dart';
import '../../../data/apiModal/getSelltementOfficerModal.dart';

import '../../../data/local_database/database_helper/database_helper.dart';
import '../../HomeScreen/HomeScreen.dart';
import '../../splash_screen/controller/splash_screen_four_controller.dart';

/// A controller class for the AppionmentScreen.
///
/// This class manages the state of the AppionmentScreen, including the
/// current appionmentModelObj
class AppionmentController extends GetxController {
  TextEditingController dateController = TextEditingController();

  TextEditingController timeController = TextEditingController();
  TextEditingController messsageController = TextEditingController();

  Rx<AppionmentModel> appionmentModelObj = AppionmentModel().obs;
  RxString selectedTimeSlot = ''.obs;
  Map<String, dynamic> bookAppoinmentData = Map();
  String str = '';
  var selectedDate;
  RxString formattterSelectedDate = ''.obs;
  RxString formattterDate = ''.obs;
  RxString formattterAPIdDate = ''.obs;
  final DatabaseHelper dbHelper = DatabaseHelper();

  DateTime? rangeStart;
  RxBool isAppointmentAppear = true.obs;
  DateTime? rangeEnd;
  RxBool isLoading = false.obs;
  RxInt selectedValue = 60.obs;
  Map<String, dynamic> bodyParamsForSlot = {};
  Map<String, dynamic> responseMapForSlot = {};
  Map<String, dynamic> bodyParamsForBookAppoinment = {};
  Map<String, dynamic> responseMapForBookAppoinment = {};
  DateTime? selectedDay;
  RxInt selectedIndex = 100.obs;
  RxList getAvailableSlot = [].obs;
  TimeZone selectedTimeZone = TimeZone('(GMT-8:00) Pacific Standard Time (PST)', "PST");
  void handleRadioValueChanged(int value) {
    print(value);
    selectedValue.value = value;
  }

  void handleDateChanged(DateTime value) {
    selectedDate = value;

    formattterSelectedDate.value =
        DateFormat('MM/dd/yyyy').format(value).toString();
    ;
    formattterAPIdDate.value =
        DateFormat('MM/dd/yyyy').format(value).toString();
    ;
    print(formattterSelectedDate.value);
  }

  RadioValueChanged(bool value) {
    radioButtonValue.value = value;
  }

  Rx<DateTime> focusedDay = DateTime.now().obs;
  RxBool radioButtonValue = false.obs;

  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;

  List<TimeZone> timeZoneList = [
    TimeZone('(GMT-5:00) Eastern Standard Time (EST)', "EST"),
    TimeZone('(GMT-6:00) Central Standard Time (CST)', "CST"),
    TimeZone('(GMT-7:00) Mountain Standard Time (MST)', 'MST'),
  TimeZone('(GMT-8:00) Pacific Standard Time (PST)', "PST"),
    TimeZone('(GMT-9:00) Alaska Standard Time (AKST)', "AKST"),
    TimeZone('(GMT-10:00) Hawaii-Aleutian Standard Time (HAST)', "HAST"),
    TimeZone('(GMT-11:00) Samoa Standard Time (SST)', "SST"),
    TimeZone('(GMT+10:00) Chamorro Standard Time (CHST)', "CHST"),
  ];

  RxInt statusId = 0.obs;
  RxString storeTime = ''.obs;
  RxBool fqNotification = false.obs;
  RxBool toNotification = false.obs;
  RxBool appoinmentNotification = false.obs;
  RxList<String> statusForFQ = <String>[].obs;
  RxList<String> statusForTO = <String>[].obs;
  RxList<String> statusForFAppointment = <String>[].obs;
  final statusInfo = Rxn<Statusinfo>();
  final getDashboardData = Rxn<GetDashBoardModel>();

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    //await  getSettlementOfficerAPI();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print("this is timezone ${selectedTimeZone}");

    getDate();
    getTimeSlote();
    getTime();

    selectedIndex.value = 3;

    db.value = await dbHelper.getUsers();
  }

  @override
  void onClose() {
    super.onClose();
    dateController.dispose();
    timeController.dispose();
  }

  Future<bool> getAvailableAPI() async {
    print("this is ${selectedTimeZone.value}");
//    isLoading.value = true;
    bodyParamsForSlot = {
      ApiKey.email: satOfficerEmail.value,
      ApiKey.date: formattterAPIdDate.value,
      ApiKey.timezone: selectedTimeZone.value
    };

    http.Response? response = await HttpMethod.instance.postRequest(
      url: UriConstant.getSlotURL,
      bodyParams: bodyParamsForSlot,
    );

    //isLoading.value = true;
    if (CM.responseCheckForPostMethod(response: response)) {
      responseMapForSlot = jsonDecode(response!.body);

      //isLoading.value = true;

      if (responseMapForSlot[ApiKey.status] == ApiKey.success) {
        print("object");

        getAvailableSlot.value = responseMapForSlot['slots'];
        print(getAvailableSlot.value[0].toString()=="msg_no_secheduled_appointment".tr);
      } else {
        //  isLoading.value = false;

        // CM.showToast(responseMapForCard[ApiKey.message]);
      }

      bodyParamsForSlot.clear();
      //  isLoading.value = false;
      return true;
    } else {
      bodyParamsForSlot.clear();
      //isLoading.value = false;
      return false;
    }
  }

  Future<void> bookAppoinmentAPI() async {
    print(selectedDate.toString());
    isLoading.value = true;
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://clearstart.irslogics.com/publicapi/Appointment/BookAppointment?apikey=f08f2b3c48ad4134b4ef62abd4aa721d'));
      request.body = json.encode({
        ApiKey.AgentEmail: satOfficerEmail.value,
        ApiKey.TimeSlot: "90",
        ApiKey.Date: selectedTimeSlot.value,
        ApiKey.CaseID: caseId.toString(),
        if (messsageController.text != null)
          ApiKey.Comments: messsageController.text,
        ApiKey.TimeZone: selectedTimeZone.value,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      isLoading.value = true;
      var data = await response.stream.bytesToString();
      bookAppoinmentData = jsonDecode(data);

      print(bookAppoinmentData);
      if (response.statusCode == 200) {
        if (bookAppoinmentData[ApiKey.status] == ApiKey.success) {
          isAppointmentAppear.value = false;
          setDate(formattterSelectedDate.value);
          formattterSelectedDate.value = formattterSelectedDate.value;
          setTimeSlote(str);
          setTime(DateTime.now().toString());

          dbHelper.updateFirstUserColumn('appoinmentNotification', 'false');
          dbHelper.updateFirstUserColumn('status', 'inactive');

          print("status changed");

          isAppointmentAppear.value = false;
          // db.value = await dbHelper.getUsers();
          // print("status is unactive ${db.value!.status}");
          // Future.delayed(const Duration(minutes: 1), () async {
          //   isAppointmentAppear.value = true;
          //   dbHelper.updateFirstUserColumn('appoinmentNotification', 'true');
          //   dbHelper.updateFirstUserColumn('status', 'active');
          //   //db.value = await dbHelper.getUsers();
          //   print(db.value!.status);
          //   getDashboard();
          //    Get.off(() => Homescreen());
          //   // selectedIndex.value = 0;
          //   print("---------------------------------data updatted");
          // });
          CM.showToast("Appointment Booked Successfully ",
              backgraoundCollor: theme.primaryColor);
          Get.back();
        }
        print(isAppointmentAppear.value);
        isLoading.value = false;
      } else {
        CM.showToast("Please filled valid details");
        isLoading.value = false;
        print(response.reasonPhrase);
      }
    } catch (e) {
      CM.showToast("Please filled valid details");
      isLoading.value = false;
      print(e);
    }
  }

  void getDate() async {
    print('thi is get appointment');

    final prefs = await SharedPreferences.getInstance();
    final key = prefs.get('date');

    var value = key;
    formattterDate.value = key.toString();

    print(formattterDate.value);

    print('YOUR date KEY - $key');
  }

  void getTimeSlote() async {
    print('thi is get TimeSlote');

    final prefs = await SharedPreferences.getInstance();
    final key = prefs.get('timeSlote');

    var value = key;
    str = key.toString();

    print(str);

    print('YOUR TimeSlote KEY - $key');
  }

  void getTime() async {
    final prefs = await SharedPreferences.getInstance();
    final key = prefs.get('time');
    if (key != null) {
      storeTime.value = key.toString();
      print(
          ' current time ${DateTime.now().toLocal().toString()}  and  ${storeTime.value}');

      var data = DateTime.parse(storeTime.value);
      var currrentTime = DateTime.now();

      print(currrentTime.difference(data));
      var differentData = currrentTime.difference(data);
      if (differentData > Duration(minutes: 5)) {
        print("big time");
        dbHelper.updateFirstUserColumn('appoinmentNotification', 'true');
        dbHelper.updateFirstUserColumn('status', 'active');
        setDate('');
      } else {
        print("short time");
        Future.delayed(differentData, () async {
          isAppointmentAppear.value = true;
          dbHelper.updateFirstUserColumn('appoinmentNotification', 'true');
          dbHelper.updateFirstUserColumn('status', 'active');

          isAppointmentAppear.value == true;
          //db.value = await dbHelper.getUsers();
          print(db.value!.status);

          getDashboard();
          Get.off(() => Homescreen());
          // selectedIndex.value = 0;
        });
      }
    }

    print('YOUR time KEY - $key');
  }

  void setDate(key) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('date', key);
    print('set date $key');
  }

  void setTime(key) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('time', key);
    print('set time $key');
  }

  void setTimeSlote(key) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('timeSlote', key);
    print('set timeSlote $key');
  }

  Future<void> getDashboard() async {
    isLoading.value = true;

    try {
      http.Response? response = await http.get(
        Uri.parse(UriConstant.dashboardURL),
        headers: {
          ApiKey.authorization: '${ApiKey.bearer} $token',
        },
      );
      isLoading.value = true;

      if (response.statusCode == 200)
        getDashboardData.value =
            GetDashBoardModel.fromJson(jsonDecode(response!.body));

      if (getDashboardData.value != null &&
          getDashboardData.value?.data != null) {
        statusInfo.value = getDashboardData.value!.data!.statusinfo;
        greatinMsg.value = getDashboardData.value!.data!.greeting!;
        statusId.value = getDashboardData.value!.data!.statusId!;
        statusName.value = getDashboardData.value!.data!.statusName!;
        meansStep.value =
            getDashboardData.value!.data!.statusinfo!.whatThisMeans ?? '';
        nextStep.value =
            getDashboardData.value!.data!.statusinfo!.whatHappensNext ?? '';
        getDashboardData.value!.data!.statusForFq!.forEach((element) {
          statusForFQ.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            fqNotification.value = true;
            dbHelper.updateFirstUserColumn('fqNotification', 'true');
          }
        });

        getDashboardData.value!.data!.statusForTo!.forEach((element) {
          statusForTO.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            toNotification.value = true;
            dbHelper.updateFirstUserColumn('toNotification', 'true');
          }
        });
        getDashboardData.value!.data!.statusForAppointment!.forEach((element) {
          statusForFAppointment.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            appoinmentNotification.value = true;
            dbHelper.updateFirstUserColumn('appoinmentNotification', 'true');
            //dbHelper.updateFirstUserColumn('status', 'active');
          }
        });

        isLoading.value = false;
      } else {
        print(response.reasonPhrase);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }
}

class TimeZone {
  String name;
  String value;

  TimeZone(this.name, this.value);
}
