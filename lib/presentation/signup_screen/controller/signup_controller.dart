import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/signup_screen/models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../api_constant/api_constant.dart';
import '../../../core/http_methods/http_methods.dart';
import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/Comman/common_method.dart';

import '../../../data/local_database/database_helper/database_helper.dart';
import '../../HomeScreen/HomeScreen.dart';
import '../../login_page_screen/controller/login_page_controller.dart';
import '../../splash_screen_four_screen/controller/splash_screen_four_controller.dart';

/// A controller class for the SignupScreen.
///
/// This class manages the state of the SignupScreen, including the
/// current signupModelObj
class SignupController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController caseIDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  RxString tnCText = ''.obs;
  final DatabaseHelper dbHelper = DatabaseHelper();
  TextEditingController confirmpasswordController = TextEditingController();
  Map<String, dynamic> bodyParamsForRegistration = {};
  Map<String, dynamic> responseMapForRegistration = {};

  Rx<SignupModel> signupModelObj = SignupModel().obs;
  RxBool isLoading  = false.obs;

  Rx<bool> rememberMeCheckbox = false.obs;
  Future<void> clickOnSignUpButton() async {

    if (formKey.currentState!.validate()) {
      if(rememberMeCheckbox.value){
        tnCText.value = '';
        registrationApiCalling();
      }

      else tnCText.value = 'msg_please_tick'.tr;


      //   Get.off(()=> Homescreen(selectedIndexValue: 0.obs));
    }
  }

  Future<bool> registrationApiCalling() async {
    isLoading.value = true;
    bodyParamsForRegistration = {
      ApiKey.caseId: caseIDController.text,
      ApiKey.email: emailController.text,
      ApiKey.password: passwordController.text,
    };
    isLoading.value = true;
    http.Response? response = await HttpMethod.instance.postRequest(
        url: UriConstant.signUpURL, bodyParams: bodyParamsForRegistration);
    isLoading.value = true;
    responseMapForRegistration = jsonDecode(response!.body);
    print("this is response ${response.body}");
    if (CM.responseCheckForPostMethod(response: response)) {


      print(responseMapForRegistration);


      if (responseMapForRegistration[ApiKey.status]) {
        CM.showToast(responseMapForRegistration[ApiKey.message],backgraoundCollor: theme.primaryColor);
        isLoading.value = false;

        Get.off(() => Homescreen());
      } else {
        isLoading.value = false;
        appoinmentNotification.value = true;
        print('the value ${appoinmentNotification.value}');
        dbHelper.updateFirstUserColumn('appoinmentNotification', 'true');
        CM.showToast(responseMapForRegistration[ApiKey.message],backgraoundCollor: Colors.white,textColor: Colors.red);

      }

      bodyParamsForRegistration.clear();
      isLoading.value = false;
      return true;
    } else {

      bodyParamsForRegistration.clear();
      isLoading.value = false;
      return false;
    }
  }



  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  onTapSignUp() {
    Get.toNamed(
      AppRoutes.dashboardContainerScreen,
    );
  }
}
