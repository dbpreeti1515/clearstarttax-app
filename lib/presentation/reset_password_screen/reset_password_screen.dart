import 'controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordScreen extends GetWidget<ResetPasswordController> {
  const ResetPasswordScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 251.v,
          width: 292.h,
          padding: EdgeInsets.symmetric(horizontal: 18.h),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomImageView(
                imagePath: ImageConstant.img112766Celebrate180x180,
                height: 180.adaptSize,
                width: 180.adaptSize,
                alignment: Alignment.topCenter,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 255.h,
                  margin: EdgeInsets.only(bottom: 9.v),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "msg_forgot_password".tr,
                          style: CustomTextStyles.titleMediumBold18,
                        ),
                        TextSpan(
                          text: "msg_password_reset_instructions".tr,
                          style: CustomTextStyles.bodyLarge_1,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
