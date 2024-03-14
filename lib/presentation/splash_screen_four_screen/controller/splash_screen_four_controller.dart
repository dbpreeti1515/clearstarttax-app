import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/HomeScreen/HomeScreen.dart';
import 'package:preeti_s_application3/presentation/splash_screen_four_screen/models/splash_screen_four_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_constant/api_constant.dart';
import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/apiModal/getDashboardModal.dart';
import '../../../data/apiModal/getSelltementOfficerModal.dart';

import '../../../data/local_database/database_helper/database_helper.dart';
import '../../dashboard_page/controller/dashboard_controller.dart';

/// A controller class for the SplashScreenFourScreen.
///
/// This class manages the state of the SplashScreenFourScreen, including the
/// current splashScreenFourModelObj
///
var token;
RxBool appoinmentNotification = false.obs;
final db = Rxn<UserModel>();

class SplashScreenFourController extends GetxController {
  Rx<SplashScreenFourModel> splashScreenFourModelObj =
      SplashScreenFourModel().obs;
  RxBool isLoading = false.obs;


  final statusInfo = Rxn<Statusinfo>();
  final getDashboardData = Rxn<GetDashBoardModel>();

  RxInt testMonialDataLenght = 0.obs;
  RxInt statusId = 0.obs;
  RxBool fqNotification = false.obs;
  RxBool toNotification = false.obs;
  RxBool isUserLogin = false.obs;

  RxList<String> statusForFQ = <String>[].obs;
  RxList<String> statusForTO = <String>[].obs;
  RxList<String> statusForFAppointment = <String>[].obs;

  final DatabaseHelper dbHelper = DatabaseHelper();





  @override
  void onReady() async {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      //Get.offNamed(AppRoutes.onboardingScreenOneScreen);

      await manageSession();
      //await Get.offAllNamed(AppRoutes.onboardingScreenOneScreen);
    });
  }

  @override
  void onInit() async {
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      getuser();

    });
    super.onInit();

    db.value = await dbHelper.getUsers();




  if(db.value!=null)
    token =db.value!.token;
  print(db.value);
    await getDashboard();



  }

  Future<void> manageSession() async {
    if (token == "" || token == null) {
      if(isUserLogin.value==true)
        await Get.offAllNamed(AppRoutes.loginPageScreen);
      else
      await Get.offAllNamed(AppRoutes.onboardingScreenOneScreen);
    } else {

      Get.off(() => Homescreen());
    }
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
            getDashboardData.value!.data!.statusinfo!.whatThisMeans ?? '';
        getDashboardData.value!.data!.statusForFq!.forEach((element) {
          statusForFQ.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            fqNotification.value = true;
            dbHelper.updateFirstUserColumn('fqNotification', 'true');

          }else{
            dbHelper.updateFirstUserColumn('fqNotification', 'false');
          }
        });

        getDashboardData.value!.data!.statusForTo!.forEach((element) {
          statusForTO.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            toNotification.value = true;
            dbHelper.updateFirstUserColumn('toNotification', 'true');

          }else{
            dbHelper.updateFirstUserColumn('toNotification', 'false');
          }
        });
        getDashboardData.value!.data!.statusForAppointment!.forEach((element) {
          statusForFAppointment.value.add(element);
          print('${element.toString()} and ${statusId.value.toString()}');

          if (element.toString() == statusId.value.toString()) {
            appoinmentNotification.value = true;
            print('the value ${appoinmentNotification.value}');
            dbHelper.updateFirstUserColumn('appoinmentNotification', 'true');
            //dbHelper.updateFirstUserColumn('status', 'active');


          }else{
            dbHelper.updateFirstUserColumn('appoinmentNotification', 'false');

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
  void getuser() async {
    print('thi is get TimeSlote');

    final prefs = await SharedPreferences.getInstance();
    final key = prefs.get('isLogin');
   isUserLogin.value = bool.parse(key.toString());
   print("is user login ${isUserLogin.value}");
   print("get user $key}");



  }


}
