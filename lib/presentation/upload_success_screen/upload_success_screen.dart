import 'controller/upload_success_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

// ignore_for_file: must_be_immutable
class UploadSuccessScreen extends GetWidget<UploadSuccessController> {
  const UploadSuccessScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 292.h,
          padding: EdgeInsets.symmetric(horizontal: 38.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: ImageConstant.img112766Celebrate,
                height: 170.v,
                width: 200.h,
              ),
              SizedBox(height: 5.v),
              SizedBox(
                width: 213.h,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "msg_congratulations".tr,
                        style: CustomTextStyles.headlineSmallBold,
                      ),
                      TextSpan(
                        text: "msg_your_document_has".tr,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
