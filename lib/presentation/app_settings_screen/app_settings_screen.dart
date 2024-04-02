import 'package:accordion/accordion_section.dart';

import '../../widgets/comman_widget.dart';
import 'controller/app_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_title_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:preeti_s_application3/widgets/custom_bottom_bar.dart';
import 'package:preeti_s_application3/widgets/custom_switch.dart';

class AppSettingsScreen extends GetWidget<AppSettingsController> {
  const AppSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: CustomAppBar(
         // leadingWidth: mediaQueryData.size.width*.126,

          leading:
          AppbarLeadingImage(
              imagePath: ImageConstant.imgbackButton,


              margin: EdgeInsets.all(mediaQueryData.size.width*.05),
              onTap: () {
               Get.back();

              }),

        ),
        body: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
              SizedBox(height: 29.v),
              Expanded(
                  child: SingleChildScrollView(child: _buildAppSettings()))
            ])),

    );
  }

  /// Section Widget


  /// Section Widget
  Widget _buildAppSettings() {
    return Padding(
        padding: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 5.v),
        child: Column(children: [
          CW.buildDashboardRow(text: "msg_fine_tune_your".tr),

          SizedBox(height: 19.v),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgClock,
                    height: 30.adaptSize,
                    width: 30.adaptSize),
                Padding(
                    padding: EdgeInsets.only(left: 15.h, top: 2.v, bottom: 3.v),
                    child: Text("msg_push_notification".tr,
                        style: theme.textTheme.titleMedium)),
                Spacer(),
                Obx(() => CustomSwitch(
                    margin: EdgeInsets.symmetric(vertical: 2.v),
                    value: controller.isSelectedSwitch.value,
                    onChange: (value) {
                      controller.isSelectedSwitch.value = value;
                    }))
              ])),
          SizedBox(height: 15.v),

          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgUser,
                    height: 30.adaptSize,
                    width: 30.adaptSize),
                Padding(
                    padding: EdgeInsets.only(left: 15.h, top: 2.v, bottom: 3.v),
                    child: Text("msg_announce_notification".tr,
                        style: theme.textTheme.titleMedium)),
                Spacer(),
                Obx(() => CustomSwitch(
                    margin: EdgeInsets.symmetric(vertical: 2.v),
                    value: controller.isSelectedSwitch1.value,
                    onChange: (value) {
                      controller.isSelectedSwitch1.value = value;
                    }))
              ]))
        ]));
  }

  /// Section Widget


  /// Navigates to the settingsScreen when the action is triggered.
  onTapImage() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
}
class MyInputForm extends StatelessWidget //__
    {


  @override
  Widget build(context) //__
  {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: const Text('Some text goes here ...'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ).marginOnly(bottom: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Submit'),
        )
      ],
    );
  }
}