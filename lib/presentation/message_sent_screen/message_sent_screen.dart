import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';

import '../../widgets/app_bar/appbar_title_image.dart';
import 'controller/message_sent_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MessageSentScreen extends GetWidget<MessageSentController> {
  const MessageSentScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        leadingWidth: 80,
        title: Container(
            height: 70.v,
            margin: EdgeInsets.only(left: 0.h, top: 10.v, bottom: 10.v),
            child: Stack(alignment: Alignment.topLeft, children: [
              Container(
                margin: EdgeInsets.only(left: 22.h, top: 17.v, bottom: 10.v),
                child: Image(
                  image: AssetImage(
                    ImageConstant.imgImage2,
                  ),
                ),
              ),
              // AppbarTitleImage(
              //     imagePath: ImageConstant.imgSantaHat1,
              //     margin: EdgeInsets.only(right: 204.h, bottom: 33.v))
            ])),
      ),
      body: Container(
        height: 260.v,
        width: 292.h,
        padding: EdgeInsets.symmetric(horizontal: 47.h),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.img112766Celebrate178x190,
              height: 178.v,
              width: 190.h,
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 195.h,
                margin: EdgeInsets.only(bottom: 5.v),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_message_sent".tr,
                        style: CustomTextStyles.headlineSmallBold,
                      ),
                      TextSpan(
                        text: "msg_your_message_has".tr,
                        style: theme.textTheme.bodyLarge,
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
    );
  }
}
