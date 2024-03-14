import 'dart:convert';

import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/get_in_touch_screen/models/get_in_touch_model.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/presentation/splash_screen_four_screen/controller/splash_screen_four_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api_constant/api_constant.dart';
import '../../../core/http_methods/http_methods.dart';
import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getUserModal.dart';

import '../../../data/models/SuccessDialogBox/SuccessBox.dart';
import '../../dashboard_page/controller/dashboard_controller.dart';

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
  File? file;

  RxString uploadUrl = "msg_file_choose".tr.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  clickOnSubmitButton(BuildContext context) async {
    print("Button clicked");

    if (formKey.currentState!.validate()) {
      await getInTouchAPI();
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
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    fullNameController.text = name.value;
    emailController.text = email.value;
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

  Future<void> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);

      uploadUrl.value = path.basename(
          file.toString()); // Replace with your server upload endpoint
      print(uploadUrl);

      // var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
      // request.files.add(
      //   http.MultipartFile(
      //     'file',
      //     file.readAsBytes().asStream(),
      //     file.lengthSync(),
      //     filename: file.path.split('/').last,
      //   ),
      // );
    } else {
      CM.showToast("Please select file");
    }
  }

  // Future<bool> getInTouchCalling(BuildContext context) async {
  //   isLoading.value = true;
  //   bodyParamsForGetInTouch = {
  //     ApiKey.name: 'caseIDController.text',
  //     ApiKey.email: emailController.text,
  //     ApiKey.message: 'message',
  //   };
  //   isLoading.value = true;
  //   http.Response? response = await HttpMethod.instance.postRequest(
  //       url: UriConstant.getInTouchURL, bodyParams: bodyParamsForGetInTouch);
  //
  //   isLoading.value = true;
  //   if (CM.responseCheckForPostMethod(response: response)) {
  //     responseMapForGetInTouch = jsonDecode(response!.body);
  //     print(responseMapForGetInTouch);
  //
  //
  //     if (responseMapForGetInTouch[ApiKey.status]) {
  //       CM.showToast(responseMapForGetInTouch[ApiKey.message]);
  //       isLoading.value = false;
  //       SuccessDialog.showCustomDialog(
  //           context, "lbl_message_sent".tr, 'msg_your_message_has'.tr, true);
  //       messageController.clear();
  //       subjectPlaceholderController.clear();
  //
  //     } else {
  //       isLoading.value = false;
  //       CM.showToast(responseMapForGetInTouch[ApiKey.message]);
  //
  //     }
  //
  //     bodyParamsForGetInTouch.clear();
  //     isLoading.value = false;
  //     return true;
  //   } else {
  //
  //     bodyParamsForGetInTouch.clear();
  //     isLoading.value = false;
  //     return false;
  //   }
  // }
  Future<void> getInTouchAPI() async {
    isLoading..value = true;
    try {
      var headers = {
        'Authorization': 'Bearer Bearer $token',
      };
      var request =
          http.MultipartRequest('POST', Uri.parse(UriConstant.getInTouchURL));
      request.fields.addAll({
        ApiKey.name: fullNameController.text,
        ApiKey.email: emailController.text,
        ApiKey.subject: subjectPlaceholderController.text,
        ApiKey.message: messageController.text
      });
      if (file != null)
        request.files.add(
            await http.MultipartFile.fromPath(ApiKey.attachment, file!.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var data = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        isLoading..value = false;
        responseMapForGetInTouch = jsonDecode(data);
        print(responseMapForGetInTouch);
        if (responseMapForGetInTouch[ApiKey.status]) {
          uploadUrl.value = "msg_file_choose".tr;
          CM.showToast(responseMapForGetInTouch[ApiKey.message]);
          isLoading.value = false;

          messageController.clear();
          subjectPlaceholderController.clear();
        } else {
          isLoading.value = false;
          CM.showToast(responseMapForGetInTouch[ApiKey.message]);
        }
      } else {
        isLoading.value = false;
        print(response.reasonPhrase);
        uploadUrl.value = "msg_file_choose".tr;
      }
    } catch (e) {
      isLoading.value = false;
      uploadUrl.value = "msg_file_choose".tr;
      print(e);
    }
  }
}
