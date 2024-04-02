import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/data/local_database/database_const/database_const.dart';
import 'package:preeti_s_application3/presentation/login_page_screen/models/login_page_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api_constant/api_constant.dart';
import '../../../core/http_methods/http_methods.dart';
import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getDashboardModal.dart';
import '../../../data/apiModal/getSelltementOfficerModal.dart';
import '../../../data/apiModal/getUserModal.dart';

import '../../../data/local_database/database_helper/database_helper.dart';
import '../../HomeScreen/HomeScreen.dart';
import '../../dashboard_page/controller/dashboard_controller.dart';
import '../../splash_screen/controller/splash_screen_four_controller.dart';

/// A controller class for the LoginPageScreen.
///
/// This class manages the state of the LoginPageScreen, including the
/// current loginPageModelObj

class LoginPageController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();
  final form_Key = GlobalKey<FormState>();
  Map<String, dynamic> bodyParamsForLogin = {};
  Map<String, dynamic> responseMapForLogin = {};
  final emailController = TextEditingController();

  final statusInfo = Rxn<Statusinfo>();
  final getDashboardData = Rxn<GetDashBoardModel>();
  final getSatOfficerData = Rxn<GetSattlementOfficerModal>();
  RxInt testMonialDataLenght = 0.obs;
  RxInt statusId = 0.obs;
  RxBool fqNotification = false.obs;
  RxBool toNotification = false.obs;

  RxList<String> statusForFQ = <String>[].obs;
  RxList<String> statusForTO = <String>[].obs;
  RxList<String> statusForFAppointment = <String>[].obs;

  Rx<LoginPageModel> loginPageModelObj = LoginPageModel().obs;

  RxBool isLoading = false.obs;
  Rx<bool> rememberMe = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }

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
      url: UriConstant.loginURL,
      bodyParams: bodyParamsForLogin,
    );
    isLoading.value = true;
    if (CM.responseCheckForPostMethod(response: response)) {
      responseMapForLogin = jsonDecode(response!.body);
      isLoading.value = true;
      token = responseMapForLogin[ApiKey.token];
      if (responseMapForLogin[ApiKey.status]) {
        CM.showToast(responseMapForLogin[ApiKey.message],backgraoundCollor: theme.primaryColor);

        if (responseMapForLogin[ApiKey.token].isNotEmpty) {
          await getDashboard(responseMapForLogin[ApiKey.token]);
        }




        isLoading.value = false;
      } else {
        isLoading.value = false;
        CM.showToast(responseMapForLogin[ApiKey.message],textColor: Colors.red,backgraoundCollor: Colors.white);
      }

      bodyParamsForLogin.clear();
      isLoading.value = false;
      return true;
    } else {
      bodyParamsForLogin.clear();
      isLoading.value = false;
      return false;
    }
  }


  Future<void> clickOnSignUpButton() async {
    if (form_Key.currentState!.validate()) {
      loginApiCalling();
    }
  }

  onTapSignIn() {
    Get.off(() => Homescreen());
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

  Future<void> getDashboard(var token) async {
    isLoading.value = true;
    try {
      http.Response? response = await http.get(
        Uri.parse(UriConstant.dashboardURL),
        headers: {
          ApiKey.authorization: '${ApiKey.bearer} $token',
        },
      );
      isLoading.value = true;

      if (response.statusCode == 200) {
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

            }
          });

          getDashboardData.value!.data!.statusForTo!.forEach((element) {
            statusForTO.value.add(element);
            if (element.toString() == statusId.value.toString()) {
              toNotification.value = true;

            }
          });
          getDashboardData.value!.data!.statusForAppointment!
              .forEach((element) {
            statusForFAppointment.value.add(element);
            if (element.toString() == statusId.value.toString()) {
              appoinmentNotification.value = true;

              print('the value ${appoinmentNotification.value}');
              dbHelper.updateFirstUserColumn('appoinmentNotification', 'true');

            }
          });

           token = responseMapForLogin[ApiKey.token];

          UserModel newUser = UserModel(token: responseMapForLogin[ApiKey.token],
              email: responseMapForLogin['user']['email'],
              name: responseMapForLogin['user']['name'],
              greeting: getDashboardData.value!.data!.greeting!,
              password: passwordController.text,
              status: responseMapForLogin['user']['status'],
              caseId:  responseMapForLogin['user']['case_id'],
              statusId: statusId.value.toString(),
              toNotification: toNotification.value.toString(),
              fqNotification:  fqNotification.value.toString(),
              appoinmentNotification:  appoinmentNotification.value.toString());



           await dbHelper.insertUser(newUser);

          Get.off(() => Homescreen());
        }
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



  Future<void> getSettlementOfficerAPI() async {
    print("Get sattlement officer api");

    var url = Uri.parse(UriConstant.getSettlementOfficerURL);

    var queryParams = {
      ApiKey.apikey: ApiKey.apikeyvalue,
      'CaseID': caseId.value
    };

    var uri = Uri.parse(url.toString()).replace(queryParameters: queryParams);

    http.Response response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        getSatOfficerData.value =
            GetSattlementOfficerModal.fromJson(jsonDecode(response.body));

        String str = getSatOfficerData.value!.data!;
        List<String> strarray = str.split(": ");

        satOfficerEmail.value = strarray[1];
        print("sat email ${satOfficerEmail.value}");
      } else {
        print('Failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
