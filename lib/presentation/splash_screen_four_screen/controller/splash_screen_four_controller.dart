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

import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/apiModal/getDashboardModal.dart';
import '../../../data/apiModal/getSelltementOfficerModal.dart';
import '../../../data/http_methods/http_methods.dart';
import '../../dashboard_page/controller/dashboard_controller.dart';

/// A controller class for the SplashScreenFourScreen.
///
/// This class manages the state of the SplashScreenFourScreen, including the
/// current splashScreenFourModelObj
///
var token ;
RxBool appoinmentNotification = false.obs;
class SplashScreenFourController extends GetxController {
  Rx<SplashScreenFourModel> splashScreenFourModelObj =
      SplashScreenFourModel().obs;
  RxBool isLoading = false.obs;

  RxList<String> statusForFAppointment = <String>[].obs;

  final statusInfo = Rxn<Statusinfo>();
  final getDashboardData = Rxn<GetDashBoardModel>();

  RxInt statusId = 0.obs;
  RxBool fqNotification = false.obs;
  RxBool toNotification = false.obs;

  void getToken() async {
    print('running');
    final prefs = await SharedPreferences.getInstance();
    final key = prefs.get('token');

    token  = key;

    print('YOUR TOKEN - $token');
    print('YOUR TOKEN KEY - $key');
  }
  void setAppointment( key) async {


    final prefs = await SharedPreferences.getInstance();

    prefs.setBool('appointment', key);
    print('set appointment $key');
  }

  @override
  void onReady() async{
    Future.delayed(const Duration(milliseconds: 3000), ()async {
      //Get.offNamed(AppRoutes.onboardingScreenOneScreen);

await manageSession();
     //await Get.offAllNamed(AppRoutes.onboardingScreenOneScreen);
    });
  }
  @override
  void onInit() async{

   SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {

     getToken();


   });
    super.onInit();
   await getDashboardAPI();


  }
  Future<void> manageSession() async {

    if(token=="" ||token==null) {

      await Get.offAllNamed(AppRoutes.onboardingScreenOneScreen);
    }  else {
      //await Get.to(()=>Homescreen(),arguments: 2);
      Get.off(()=> Homescreen(isAppoinment: appoinmentNotification.value,getDashboardData: getDashboardData.value,));
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





        getDashboardData.value!.data!.statusForAppointment!.forEach((element) {
          statusForFAppointment.value.add(element);
          if (element.toString() == statusId.value.toString()) {
            print("${element.toString()} and ${statusId.value.toString()} ");

            appoinmentNotification.value = true;
            setAppointment(true);


          }
          greatinMsg.value =
          getDashboardData.value!.data!.greeting.toString();
        });

      }

      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
      // Handle errors
      print('Error fetching data: $error');
    }
  }
  }




