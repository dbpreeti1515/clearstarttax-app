import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getDashboardModal.dart';
import '../../../data/apiModal/getSelltementOfficerModal.dart';
import '../../../data/api_constant/api_constant.dart';
import '../../../data/http_methods/http_methods.dart';
import '../../../routes/app_routes.dart';
import '../../splash_screen_four_screen/controller/splash_screen_four_controller.dart';
import '../../status_screen/status_screen.dart';

RxInt selectedIndex = 0.obs;
class HomeScreenController extends GetxController {
  RxBool appoinmentNotification = false.obs;

  RxInt currentIndex = 0.obs;

  RxList<String> statusForFAppointment = <String>[].obs;

  final statusInfo = Rxn<Statusinfo>();
  final getDashboardData = Rxn<GetDashBoardModel>();
  final getSatOfficerData = Rxn<GetSattlementOfficerModal>();
  RxList<String> statusForFQ = <String>[].obs;
  RxList<String> statusForTO = <String>[].obs;
  RxInt statusId = 0.obs;
  RxBool fqNotification = false.obs;
  RxBool toNotification = false.obs;
  int intValue = 1;
  RxBool isLoading = false.obs;
  var showNavigationBar = true.obs;
  RxMap LogoutResponse = Map().obs;
  void onItemTapped(int index) {
    currentIndex.value = index;
  }



  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      print("${ appoinmentNotification.value} this is ");

      getToken();
      showNavigationBar.value = false;

      print(appoinmentNotification.value);
    });
  }

  void setToken(key) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('token', key);
    print('set TOKEN $key');
  }

  getToken() async {
    print('running');
    final prefs = await SharedPreferences.getInstance();
    final key = prefs.get('token');

    token  = key.toString();

    print('YOUR TOKEN - $token');
    print('YOUR TOKEN KEY - $key');
  }
  Future<void> logoutAPI() async {
    try {
      isLoading.value = true;

      http.Response? response = await HttpMethod.instance.postRequest(

        url: UriConstant.logOutURL, bodyParams: {},
      );
      LogoutResponse.value = jsonDecode(response!.body);
      isLoading.value = true;
      print(LogoutResponse.value[ApiKey.status]);
      if(LogoutResponse.value[ApiKey.status]==true){

        CM.showToast(LogoutResponse.value[ApiKey.message]);
        setToken('');
        Get.toNamed(
          AppRoutes.loginPageScreen,
        );


      }


      isLoading.value = false;
    } catch (error) {
      CM.showToast(LogoutResponse.value[ApiKey.message]);
      isLoading.value = false;
      // Handle errors
      print('Error fetching data: $error');
      CM.showToast(LogoutResponse.value[ApiKey.message]);
    }
  }


  onTaxNews() {
    Get.toNamed(
      AppRoutes.taxNewsScreen,
    );
  }

  onAppSetting() {
    Get.toNamed(
      AppRoutes.appSettingsScreen,
    );
  }

  onFQQ() {
    Get.toNamed(
      AppRoutes.faqScreen,
    );
  }

  onGetInTouch() {
    Get.toNamed(
      AppRoutes.getInTouchScreen,
    );
  }

  onMoreInfo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return StatusScreen(getDashboardData: getDashboardData.value,);
    },));
  }

  onLogout()async {
   await logoutAPI();




  }
}
