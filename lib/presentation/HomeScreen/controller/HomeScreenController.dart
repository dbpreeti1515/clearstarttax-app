import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:preeti_s_application3/data/apiModal/getUserModal.dart';
import 'package:preeti_s_application3/data/local_database/database_helper/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../api_constant/api_constant.dart';
import '../../../core/http_methods/http_methods.dart';
import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getDashboardModal.dart';
import '../../../data/apiModal/getSelltementOfficerModal.dart';

import '../../../routes/app_routes.dart';
import '../../../theme/theme_helper.dart';
import '../../dashboard_page/controller/dashboard_controller.dart';
import '../../splash_screen/controller/splash_screen_four_controller.dart';
import '../../status_screen/status_screen.dart';

RxInt selectedIndex = 0.obs;
RxString randomText1 = ''.obs;
RxString randomText2 = ''.obs;
RxString password = ''.obs;

class HomeScreenController extends GetxController {

  final DatabaseHelper dbHelper = DatabaseHelper();
  RxInt currentIndex = 0.obs;

  int intValue = 1;

  RxBool isLoading = false.obs;
  var showNavigationBar = true.obs;
  RxMap LogoutResponse = Map().obs;




  void onItemTapped(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() async {




      db.value = await dbHelper.getUsers();
      print(db.value!.token);
      final users = await dbHelper.getAllUsers();

      // Display user data
      for (var user in users) {
        print(user.toMap());
      }
      name.value =db.value!.name;
      caseId.value =db.value!.caseId;
      email.value =db.value!.email;

       print("rh ${db.value!.fqNotification=='true'}");






    super.onInit();

      randomText1.value = generateRandomText(16);
      randomText2.value = generateRandomText(16);
      password.value= db.value!.password;

    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      print("${appoinmentNotification.value} this is ");


      showNavigationBar.value = false;

      print(appoinmentNotification.value);
    });
  }


  String generateRandomText(int length) {
    final random = Random();
    const chars = 'dr0123fh456789aw'; // You can include additional characters if needed

    return String.fromCharCodes(
      Iterable.generate(
          length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }

  Future<void> logoutAPI() async {
    print("logout api");
    print(db.value!.token);
    try {
      isLoading.value = true;

      http.Response? response = await HttpMethod.instance.postRequest(
        url: UriConstant.logOutURL,
        bodyParams: {},
      );
      LogoutResponse.value = jsonDecode(response!.body);
      isLoading.value = true;
      print(LogoutResponse.value[ApiKey.status]);
      if (LogoutResponse.value[ApiKey.status] == true) {

         CM.showToast(LogoutResponse.value[ApiKey.message],backgraoundCollor: Colors.white,textColor: Colors.red,);
        await dbHelper.deleteAllUsers();

        Get.toNamed(
          AppRoutes.loginPageScreen,
        );
      }

      isLoading.value = false;
    } catch (error) {
      CM.showToast(LogoutResponse.value[ApiKey.message],);
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
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return StatusScreen(

        );
      },
    ));
  }

  onLogout() async {

    await logoutAPI();

  }
}
