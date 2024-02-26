import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/data/local_database/database_const/database_const.dart';
import 'package:preeti_s_application3/presentation/login_page_screen/models/login_page_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/api_constant/api_constant.dart';
import '../../../data/http_methods/http_methods.dart';
import '../../../data/local_database/database_helper/database_helper.dart';
import '../../HomeScreen/HomeScreen.dart';
import '../../splash_screen_four_screen/controller/splash_screen_four_controller.dart';

/// A controller class for the LoginPageScreen.
///
/// This class manages the state of the LoginPageScreen, including the
/// current loginPageModelObj

class LoginPageController extends GetxController {
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParamsForLogin = {};
  Map<String, dynamic> responseMapForLogin = {};
  final emailController = TextEditingController();


  Rx<LoginPageModel> loginPageModelObj = LoginPageModel().obs;

RxBool isLoading = false.obs;
  Rx<bool> rememberMe = false.obs;

  @override
  void onClose() {
    super.onClose();
    passwordController.dispose();
  }


  Future<bool> loginApiCalling() async {
    isLoading.value = true;
    bodyParamsForLogin = {
      ApiKey.email: emailController.text,
      ApiKey.password: passwordController.text
    };
    http.Response? response = await HttpMethod.instance.postRequest(
        url: UriConstant.loginURL, bodyParams: bodyParamsForLogin,);
    isLoading.value = true;
    if (CM.responseCheckForPostMethod(response: response)) {
      responseMapForLogin = jsonDecode(response!.body);
      isLoading.value = true;
      //token = responseMapForLogin[ApiKey.token];
     if(responseMapForLogin[ApiKey.status]){
       CM.showToast(responseMapForLogin[ApiKey.message]);
       setToken(responseMapForLogin[ApiKey.token]);
       setEmail(responseMapForLogin['user']['email']);
       setPassword(passwordController.text);
       print(responseMapForLogin['user']['email']);
       isLoading.value = false;
       Get.off(()=> Homescreen(isAppoinment: appoinmentNotification.value));
      }else{
       isLoading.value = false;
       CM.showToast(responseMapForLogin[ApiKey.message]);
     }
     // userId = responseMapForLogin[ApiKey.user_id];
     // otp = responseMapForLogin[ApiKey.otp].toString();
      bodyParamsForLogin.clear();
      isLoading.value = false;
      return true;
    } else {
      bodyParamsForLogin.clear();
      isLoading.value = false;
      return false;
    }
  }
  void setToken( key) async {


    final prefs = await SharedPreferences.getInstance();

    prefs.setString('token', key);
    print('set TOKEN $key');
  }
  void setEmail( key) async {


    final prefs = await SharedPreferences.getInstance();

    prefs.setString('email', key);
    print('set EMAIL $key');
  }
  void setPassword( key) async {


    final prefs = await SharedPreferences.getInstance();

    prefs.setString('password', key);
    print('set password $key');
  }


  Future<void> clickOnSignUpButton() async {

    if (formKey.currentState!.validate()) {

      loginApiCalling();


    }
  }
  onTapSignIn() {
    Get.off(()=> Homescreen(isAppoinment: appoinmentNotification.value));
  }
  onTapTxtForgotYourPassword() {
    Get.toNamed(
      AppRoutes.forgetPasswordScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapTxtSignUpNow() {
    Get.toNamed(
      AppRoutes.signupScreen,
    );
  }
}
