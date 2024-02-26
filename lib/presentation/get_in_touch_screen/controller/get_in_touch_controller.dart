import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/get_in_touch_screen/models/get_in_touch_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getUserModal.dart';
import '../../../data/api_constant/api_constant.dart';
import '../../../data/http_methods/http_methods.dart';
import '../../../data/models/SuccessDialogBox/SuccessBox.dart';

/// A controller class for the GetInTouchScreen.
///
/// This class manages the state of the GetInTouchScreen, including the
/// current getInTouchModelObj
class GetInTouchController extends GetxController {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController subjectPlaceholderController = TextEditingController();

  TextEditingController messageController = TextEditingController();

  Rx<GetInTouchModel> getInTouchModelObj = GetInTouchModel().obs;

  Map<String, dynamic> bodyParamsForGetInTouch = {};
  Map<String, dynamic> responseMapForGetInTouch = {};
  RxBool isLoading = false.obs;
  final getUserData = Rxn<GetUserData>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

   clickOnSubmitButton(BuildContext context) async {
    print("Button clicked");


    if (formKey.currentState!.validate()) {


     await getInTouchCalling(context);
    }
  }
   void launchPhone() async {
    const String phone = 'tel:+18882350004';
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }
@override
  void onInit()async {
    // TODO: implement onInit
    super.onInit();
    await getUserDataAPI();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    fullNameController.dispose();

    emailController.dispose();
    subjectPlaceholderController.dispose();
    messageController.dispose();

    super.dispose();
  }
  @override
  void onClose() {
    super.onClose();

  }

  Future<void> getUserDataAPI() async {
    try {
      isLoading.value = true;

      http.Response? response = await HttpMethod.instance.getRequest(
        url: UriConstant.getUserURL,
      );

      getUserData.value =
          GetUserData.fromJson(jsonDecode(response!.body));

      fullNameController.text = getUserData.value!.user!.name.toString();
      emailController.text = getUserData.value!.user!.email.toString();

      isLoading.value = false;
    } catch (error) {
      isLoading.value = false;
      // Handle errors
      print('Error fetching data: $error');
    }
  }

  Future<bool> getInTouchCalling(BuildContext context) async {
    isLoading.value = true;
    bodyParamsForGetInTouch = {
      ApiKey.name: 'caseIDController.text',
      ApiKey.email: emailController.text,
      ApiKey.message: 'message',
    };
    isLoading.value = true;
    http.Response? response = await HttpMethod.instance.postRequest(
        url: UriConstant.getInTouchURL, bodyParams: bodyParamsForGetInTouch);
    isLoading.value = true;
    if (CM.responseCheckForPostMethod(response: response)) {
      responseMapForGetInTouch = jsonDecode(response!.body);
      print(responseMapForGetInTouch);


      if (responseMapForGetInTouch[ApiKey.status]) {
        CM.showToast(responseMapForGetInTouch[ApiKey.message]);
        isLoading.value = false;
        SuccessDialog.showCustomDialog(
            context, "lbl_message_sent".tr, 'msg_your_message_has'.tr, true);
        messageController.clear();
        subjectPlaceholderController.clear();

      } else {
        isLoading.value = false;
        CM.showToast(responseMapForGetInTouch[ApiKey.message]);

      }

      bodyParamsForGetInTouch.clear();
      isLoading.value = false;
      return true;
    } else {

      bodyParamsForGetInTouch.clear();
      isLoading.value = false;
      return false;
    }
  }
}
