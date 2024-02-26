import 'dart:convert';
import 'dart:ffi';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/data/API_Services/apiEndpoint.dart';
import 'package:preeti_s_application3/presentation/dashboard_page/models/dashboard_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getDashboardModal.dart';
import '../../../data/apiModal/getSelltementOfficerModal.dart';
import '../../../data/apiModal/getUserModal.dart';
import '../../../data/api_constant/api_constant.dart';
import '../../../data/http_methods/http_methods.dart';
import '../../tax_news_screen/models/tax_news_model.dart';
import '../models/userprofile_item_model.dart';

/// A controller class for the DashboardPage.
///
/// This class manages the state of the DashboardPage, including the
/// current dashboardModelObj
///
RxString name = ''.obs;
RxString greatinMsg = ''.obs;
RxString email = ''.obs;
RxString caseId = ''.obs;
RxString satOfficerEmail = ''.obs;

class DashboardController extends GetxController {

  RxBool isLoading = false.obs;

  RxMap uploadDocumentData = Map().obs;

  final getUserData = Rxn<GetUserData>();

  final statusInfo = Rxn<Statusinfo>();
  final getDashboardData = Rxn<GetDashBoardModel>();
  final getSatOfficerData = Rxn<GetSattlementOfficerModal>();
 RxInt testMonialDataLenght = 0.obs;
  RxInt statusId = 0.obs;
  RxBool fqNotification = false.obs;
  RxBool toNotification = false.obs;
  RxBool appoinmentNotification = false.obs;
  RxList<String> statusForFQ = <String>[].obs;
  RxList<String> statusForTO = <String>[].obs;
  RxList<String> statusForFAppointment = <String>[].obs;
  RxList testMonialData = [].obs;
  RxBool notification = true.obs;
  Rx<PageController> pageController = PageController(viewportFraction: 0.8).obs;
  RxDouble currentPage = 0.0.obs;
  UserprofileItemModel userprofileItemModelObj = UserprofileItemModel();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();


      pageController.value.addListener(() {
        currentPage.value = pageController.value.page!;
        pageController.value = PageController(viewportFraction: 0.8);
        currentPage = 0.0.obs;
      });




    await getDashboardAPI();
    await getUserDataAPI();
    await TestimonialAPI();



  }
  Rx<TaxNewsModel> taxNewsModelObj = TaxNewsModel().obs;
  Future<void> TestimonialAPI() async {
    final response = await http.get(Uri.parse(UriConstant.testimonialURL));

    if (response.statusCode == 200) {
      isLoading.value = false;
      testMonialData.value = json.decode(response.body);
      testMonialDataLenght.value = 2;
    } else {
      isLoading.value = false;
      throw Exception('Failed to load user data');
    }
  }
  Future<void> getDashboardAPI() async {
    try {
      isLoading.value = true;

      http.Response? response = await HttpMethod.instance.getRequest(
        url: UriConstant.dashboardURL,
      );

      getDashboardData.value =
          GetDashBoardModel.fromJson(jsonDecode(response!.body));
      if (getDashboardData.value != null &&
          getDashboardData.value?.data != null) {
        statusInfo.value = getDashboardData.value!.data!.statusinfo;
        statusId.value = getDashboardData.value!.data!.statusId!;
        getDashboardData.value!.data!.statusForFq!.forEach((element) {
          statusForFQ.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            fqNotification.value = true;
            print(fqNotification.value);
          }
        });

        getDashboardData.value!.data!.statusForTo!.forEach((element) {
          statusForTO.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            toNotification.value = true;
            print(toNotification.value);
          }
        });
        getDashboardData.value!.data!.statusForAppointment!.forEach((element) {
          statusForFAppointment.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            appoinmentNotification.value = true;
            print(appoinmentNotification.value);
          }
        });
        print(statusForFAppointment);
        print(statusForTO.value);
      }

      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
      // Handle errors
      print('Error fetching data: $error');
    }
  }
  Future<void> getUserDataAPI() async {
    print("get user api called");
    try {


      http.Response? response = await HttpMethod.instance.getRequest(
        url: UriConstant.getUserURL,
      );

      getUserData.value =
          GetUserData.fromJson(jsonDecode(response!.body));


       name.value = getUserData.value!.user!.name.toString();
       email.value = getUserData.value!.user!.email.toString();
       caseId.value = getUserData.value!.user!.caseId.toString();


      await  getSettlementOfficerAPI();


    } catch (error) {
      isLoading.value = false;
      // Handle errors

      print('Error fetching data: $error');
    }
  }

  onClickNotification() {
    notification.value = false;
  }


  Future<void> getSettlementOfficerAPI() async {

    var url = Uri.parse(UriConstant.getSettlementOfficerURL);

    var queryParams = {
      ApiKey.apikey: ApiKey.apikeyvalue,
      'CaseID': caseId.value
    };

    var uri = Uri.parse(url.toString()).replace(queryParameters: queryParams);

    http.Response response = await http.get(uri);
;
    try {


      if (response.statusCode == 200) {

        //print(testimonialDescriptionModal.fromJson(jsonDecode(response.body??'') as Map<String,dynamic>));
         getSatOfficerData.value = GetSattlementOfficerModal.fromJson(jsonDecode(response.body));


         String str = getSatOfficerData.value!.data!;
         List<String> strarray = str.split(": ");

         satOfficerEmail.value = strarray[1];



      } else {

        print('Failed with status: ${response.statusCode}');

      }
    } catch (e) {

      print('Error: $e');
    }
  }
}
