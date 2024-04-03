import 'dart:convert';

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/get_in_touch_screen/models/get_in_touch_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../api_constant/api_constant.dart';
import '../../../core/http_methods/http_methods.dart';
import '../../../data/API_Services/apiEndpoint.dart';
import '../../../data/Comman/common_method.dart';
import '../../../data/apiModal/getUserModal.dart';

import '../../../data/models/SuccessDialogBox/SuccessBox.dart';
import '../../../widgets/comman_widget.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../../dashboard_page/controller/dashboard_controller.dart';
import '../../splash_screen/controller/splash_screen_four_controller.dart';

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

  final List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),

  ];

  clickOnSubmitButton(BuildContext context) async {


    if (formKey.currentState!.validate()) {
      await getInTouchAPI(context);
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
  Future<void> getInTouchAPI(BuildContext context) async {
    isLoading..value = true;
    try {
      var headers = {
        'Authorization': 'Bearer $token',
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

        if (responseMapForGetInTouch[ApiKey.status]) {
          uploadUrl.value = "msg_file_choose".tr;
          SuccessDialog.showCustomDialog(context, "lbl_message_sent".tr,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'msg_success1'.tr,
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'lbl_888_235_0004'.tr,
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        CW.launchPhone();

                        },
                    ),
                    TextSpan(
                      text: 'msg_success2'.tr,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              )
          );
        //  showDateListDialog(context,responseMapForGetInTouch[ApiKey.message]);
         // CM.showToast(responseMapForGetInTouch[ApiKey.message]);
          isLoading.value = false;

          messageController.clear();
          subjectPlaceholderController.clear();
        } else {
          isLoading.value = false;

          CM.showToast(responseMapForGetInTouch[ApiKey.message]);
        }
      }
      if(response.statusCode==500){
        messageController.clear();
        subjectPlaceholderController.clear();
        CM.showToast("server Error! Try again later ");


      }

      else {
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
  void showDateListDialog(
      BuildContext context,text
      ) {
    showDialog(
      useSafeArea: true,


      context: context,
      builder: (BuildContext context) {
        RxBool isColor = false.obs;
        return AlertDialog(
          insetPadding: EdgeInsets.all(25),
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,

          title: Center(child: Text("Message sent!")),
          content: Container(
            child: Text(text,textAlign: TextAlign.center,),
          ),

          actions: [
            Center(
              child: CustomOutlinedButton(
                 margin: EdgeInsets.symmetric(horizontal: 20),
                  buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor:theme.primaryColor
                  ),
                  width: 100.h,
                  text: "lbl_close".tr,
                  onPressed:(){
                    Get.back();
                  }
              
              
              
              ),
            )
          ],
        );
      },
    );
  }

}
