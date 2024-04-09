import 'package:preeti_s_application3/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/apiModal/getDashboardModal.dart';
import '../../widgets/comman_widget.dart';
import '../splash_screen/controller/splash_screen_four_controller.dart';
import 'controller/status_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_title_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:preeti_s_application3/widgets/custom_bottom_bar.dart';

class StatusScreen extends GetWidget<StatusController> {
  StatusController controller = Get.put(StatusController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        // leadingWidth: mediaQueryData.size.width*.126,

        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgbackButton,
            margin: EdgeInsets.all(mediaQueryData.size.width * .05),
            onTap: () {
              Get.back();
              //  Get.offAllNamed(AppRoutes.homeScreen);
            }),
      ),
      body: SizedBox(
          width: double.maxFinite,
          child: Column(children: [
            SizedBox(height: 19.v),
            Expanded(child: _buildStatusColumn()),
          ])),
    );
  }

  Widget _buildFrameNineColumn() {
    return Container(
        decoration: AppDecoration.outlineBlack900
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CW.statusCard(
                  text: "msg_your_case_status".tr + statusName.value,
                  height: 100.h),
              SizedBox(height: 19.v),
              Padding(
                  padding: EdgeInsets.only(left: 20.h, right: 39.h),
                  child: _buildYourNextStepsRow(
                      yourNextStepsText: "msg_what_this_means".tr,
                      detailsShownHereText: meansStep.value)),
              SizedBox(height: 20.v),
              Padding(
                  padding: EdgeInsets.only(left: 20.h, right: 39.h),
                  child: _buildYourNextStepsRow(
                      yourNextStepsText: "msg_your_next_steps".tr,
                      detailsShownHereText: nextStep.value)),
              SizedBox(height: 17.v),
              if(db.value!.fqNotification=='true')
              Obx(() {
                return controller.password.value == ''
                    ? SizedBox()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: _buildCompleteOnlineRow(
                            completeOnlineText: "msg_complete_online".tr,
                            clickHereText: "lbl_click_here".tr,
                            url:
                                'https://client.clearstarttax.com/fqs/app/${email.value}/${controller.randomText1.value}${controller.password}${controller.randomText2.value}'));
              }),
              SizedBox(height: 20.v),
              if(db.value!.toNotification=='true')
              Obx(() {
                return controller.password.value == ''
                    ? SizedBox()
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: _buildCompleteOnlineRow(
                            completeOnlineText: "msg_complete_online2".tr,
                            clickHereText: "lbl_click_here".tr,
                            url:
                                'https://client.clearstarttax.com/tos/app/${email.value}/${controller.randomText2.value}${controller.password}${controller.randomText1.value}'));
              }),



              if(db.value!.toNotification=='true')
              SizedBox(height: 35.v)
            ]));
  }

  Widget _buildCompleteOnlineRow(
      {required String completeOnlineText,
      required String clickHereText,
      required String url}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.v),
        decoration: AppDecoration.fillYellow
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Container(
                      width: 234.h,
                      margin: EdgeInsets.only(top: 1.v),
                      child: Text(completeOnlineText,
                          style: CustomTextStyles.labelLarge_1
                              .copyWith(color: appTheme.black900)))),
              Padding(
                  padding: EdgeInsets.only(left: 14.h, top: 10.v, bottom: 11.v),
                  child: TextButton(
                    onPressed: () async {
                      if (await canLaunch(url)) {

                        await launch(url,

                            forceWebView: true, enableJavaScript: true,
                        );
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(clickHereText,
                        style: CustomTextStyles.labelLargeOnError
                            .copyWith(color: theme.colorScheme.onError)),
                  ))
            ]));
  }

  Widget _buildYourNextStepsRow({
    required String yourNextStepsText,
    required String detailsShownHereText,
  }) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Text(
                yourNextStepsText,
                style: theme.textTheme.titleMedium!
                    .copyWith(color: appTheme.black900),
                textAlign: TextAlign.left,
              )),
          Text(detailsShownHereText,
              style: CustomTextStyles.bodyMediumOnError
                  .copyWith(color: theme.colorScheme.onError))
        ]);
  }

  /// Section Widget
  Widget _buildStatusColumn() {
    return Padding(
        padding: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 5.v),
        child: Column(children: [
          Obx(() => CW.buildDashboardRow(text: "msg_track_your_case".tr)),
          SizedBox(height: 20.v),
          _buildFrameNineColumn(),
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }

  /// Common widget
  Widget _buildStatusRow({
    required String yourNextStepsText,
    required String detailsShownHereText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(yourNextStepsText,
              style: theme.textTheme.titleMedium!
                  .copyWith(color: appTheme.black900))),
      Padding(
          padding: EdgeInsets.only(bottom: 4.v),
          child: TextButton(
            onPressed: () async {
              print("button clicked");
              const url = 'https://www.geeksforgeeks.org/';
              if (await canLaunch(url)) {
                await launch(url, forceWebView: true, enableJavaScript: true);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text(detailsShownHereText,
                style: CustomTextStyles.bodyMediumOnError
                    .copyWith(color: theme.colorScheme.onError)),
          ))
    ]);
  }

  /// Common widget
  Widget _buildFrameTwentySevenRow({
    required String completeOnlineText,
    required String clickHereText,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.v),
        decoration: AppDecoration.fillYellow
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Container(
                      width: 234.h,
                      margin: EdgeInsets.only(top: 1.v),
                      child: Text(completeOnlineText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.labelLarge_1
                              .copyWith(color: appTheme.black900)))),
              Padding(
                  padding: EdgeInsets.only(left: 14.h, top: 10.v, bottom: 11.v),
                  child: Text(clickHereText,
                      style: CustomTextStyles.labelLargeOnError
                          .copyWith(color: theme.colorScheme.onError)))
            ]));
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImage() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
}
