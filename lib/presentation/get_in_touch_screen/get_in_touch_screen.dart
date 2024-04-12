import 'package:flutter/cupertino.dart';

import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/comman_widget.dart';
import 'controller/get_in_touch_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/core/utils/validation_functions.dart';

import 'package:preeti_s_application3/widgets/custom_outlined_button.dart';
import 'package:preeti_s_application3/widgets/custom_text_form_field.dart';

class GetInTouchScreen extends GetWidget<GetInTouchController> {
  GetInTouchScreen({Key? key}) : super(key: key);
  final GetInTouchController _controller = Get.put(GetInTouchController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildCustomAppBar(),
      body: ScrollConfiguration(
        behavior: ListScrollBehaviour(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(height: 19.v),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: Form(
                  key: _controller.formKey,
                  child: Column(children: [
                    CW.buildDashboardRow(text: "lbl_write_heading".tr),
                    SizedBox(height: 16.v),
                    Container(
                        decoration: AppDecoration.outlineBlack.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          _buildColumnFrameTwentySix(),
                          // SizedBox(height: 22.v),
                          // _nameField(),

                          // SizedBox(height: 11.v),
                          // _emailField(),
                          SizedBox(height: 13.v),
                          _subjectField(),

                          SizedBox(height: 14.v),
                          _messageField(context),
                          SizedBox(height: 20.v)
                        ])),
                    SizedBox(height: 50.v),
                  ]),
                )),
            SizedBox(height: 190.v),
          ]),
        ),
      ),
    );
  }

  CustomAppBar buildCustomAppBar() {
    return CustomAppBar(
      // leadingWidth: mediaQueryData.size.width*.126,

      leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgbackButton,
          margin: EdgeInsets.all(mediaQueryData.size.width * .05),
          onTap: () {
            Get.back();
            //  Get.offAllNamed(AppRoutes.homeScreen);
          }),
    );
  }

  /// Section Widget
  Widget _buildColumnFrameTwentySix() {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 14.v),
        decoration: AppDecoration.outlineBlack.copyWith(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: theme.primaryColor),
        child: Text("lbl_get_in_touch".tr,
            textAlign: TextAlign.center,
            style: CustomTextStyles.titleMediumOnPrimaryContainer18));
  }

  /// Section Widget
  Widget _emailField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_email_address2".tr, style: theme.textTheme.titleMedium),
          SizedBox(height: 12.v),
          CustomTextFormField(
              focusNode: _controller.focusNodes[0],
              controller: controller.emailController,
              hintText: "msg_enter_email_address".tr,
              hintStyle: CustomTextStyles.bodyLargeGray60001,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              })
        ]));
  }

  /// Section Widget
  Widget _messageField(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 14.h),
        child: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child:
                  Text("lbl_message".tr, style: theme.textTheme.titleMedium)),
          SizedBox(height: 9.v),
          CustomTextFormField(
              onChange: (value) {
                if (controller.formKey.currentState!.validate()) {

                }
              },
              focusNode: _controller.focusNodes[1],
              controller: controller.messageController,
              hintText: "lbl_write_message".tr,
              hintStyle: CustomTextStyles.bodyLargeGray60001,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value == null || (value.isEmpty)) {
                  return "msg_enter_this_field".tr;
                }
                return null;
              },
              maxLines: 4),
          SizedBox(height: 20.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Text("lbl_upload_docment".tr,
                  style: theme.textTheme.titleMedium)),
          SizedBox(height: 5.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade500,
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      controller.uploadFile();
                    },
                    child: Text(
                      "Choose file",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  width: 10.h,
                ),
                SizedBox(
                  width: mediaQueryData.size.width * 0.5,
                  child: Obx(() => Text(controller.uploadUrl.value,
                      style: theme.textTheme.bodySmall!
                          .copyWith(overflow: TextOverflow.ellipsis))),
                )
              ],
            ),
          ),
          SizedBox(height: 25.v),
          Obx(() {
            return _controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomOutlinedButton(
                    buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor),
                    width: 150.h,
                    text: "lbl_submit".tr,
                    onPressed: () {
                      controller.clickOnSubmitButton(context);
                    });
          }),
          SizedBox(height: 25.v),
          Text(
            "msg_need_to_call_us".tr,
          ),
          SizedBox(height: 10.v),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "msg_contact_hours".tr,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                  children: [
                    TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                        text: 'msg_contact_time'.tr)
                  ])),
          SizedBox(height: 4.v),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'msg_phone'.tr,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10.h,
            ),
            CustomImageView(
                imagePath: ImageConstant.imgSolarPhoneCallingBroken,
                height: 15.adaptSize,
                width: 15.adaptSize),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 5, top: 0),
                minimumSize: Size(30, 20),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                CW.launchPhone();
              },
              child: Text("lbl_888_235_0004".tr,
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 13.fSize,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ]),
        ]));
  }

  Widget _subjectField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 10.h),
              child:
                  Text("lbl_subject".tr, style: theme.textTheme.titleMedium)),
          SizedBox(height: 10.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: CustomTextFormField(
                onChange: (value) {
    if (controller.formKey.currentState!.validate()) {

    }
                },
                focusNode: controller.subjectFocusNode,
                  validator: (value) {
                    if ( value == null || value.isEmpty) {
                      return "msg_enter_this_field".tr;
                    }
                    return null;
                  },
                  controller: controller.subjectPlaceholderController,
                  hintText: "lbl_write_subject".tr,
                  hintStyle: CustomTextStyles.bodyLargeGray60001)),
        ],
      ),
    );
  }

  Widget _nameField() {
    return Container(
      padding: EdgeInsets.only(left: 10.h, right: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("lbl_full_name".tr, style: theme.textTheme.titleMedium),
          SizedBox(height: 11.v),
          CustomTextFormField(
            focusNode: controller.messageFocusNode,
              controller: controller.fullNameController,
              hintText: "lbl_enter_full_name".tr,
              hintStyle: CustomTextStyles.bodyLargeGray60001,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "err_msg_please_enter_valid_name".tr;
                }
                return null;
              }),
        ],
      ),
    );
  }
}
