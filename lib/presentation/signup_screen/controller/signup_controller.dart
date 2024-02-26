import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/signup_screen/models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/api_constant/api_constant.dart';
import '../../../data/http_methods/http_methods.dart';
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

  TextEditingController confirmpasswordController = TextEditingController();
  Map<String, dynamic> bodyParamsForRegistration = {};
  Map<String, dynamic> responseMapForRegistration = {};

  Rx<SignupModel> signupModelObj = SignupModel().obs;
  RxBool isLoading  = false.obs;

  Rx<bool> rememberMeCheckbox = false.obs;
  Future<void> clickOnSignUpButton() async {
    if (formKey.currentState!.validate()) {
      registrationApiCalling();
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
    if (CM.responseCheckForPostMethod(response: response)) {
      responseMapForRegistration = jsonDecode(response!.body);
      print(responseMapForRegistration);


      if (responseMapForRegistration[ApiKey.status]) {
        CM.showToast(responseMapForRegistration[ApiKey.message]);
        isLoading.value = false;
        setToken(responseMapForRegistration[ApiKey.token]);
        Get.off(() => Homescreen(isAppoinment: appoinmentNotification.value));
      } else {
        isLoading.value = false;
        CM.showToast(responseMapForRegistration[ApiKey.message]);

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

  void setToken(key) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('token', key);
    print('set TOKEN $key');
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
