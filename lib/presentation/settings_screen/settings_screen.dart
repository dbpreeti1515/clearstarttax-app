import 'controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_title_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:preeti_s_application3/widgets/custom_bottom_bar.dart';
import 'package:preeti_s_application3/widgets/custom_text_form_field.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 20.v),
                  Expanded(
                      child:
                          SingleChildScrollView(child: _buildSettingsColumn()))
                ])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 70.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgSolarHamburgerMenuBroken,
            margin: EdgeInsets.only(left: 30.h, top: 20.v, bottom: 15.v)),
        title: Container(
            height: 67.v,
            width: 246.26001.h,
            margin: EdgeInsets.only(left: 32.h),
            child: Stack(alignment: Alignment.topLeft, children: [
              AppbarTitleImage(
                  imagePath: ImageConstant.imgImage2,
                  margin: EdgeInsets.only(left: 22.h, top: 17.v)),
              // AppbarTitleImage(
              //     imagePath: ImageConstant.imgSantaHat1,
              //     margin: EdgeInsets.only(right: 204.h, bottom: 33.v))
            ])),
        styleType: Style.bgShadow);
  }

  /// Section Widget
  Widget _buildSettingsColumn() {
    return Padding(
        padding: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 5.v),
        child: Column(children: [
          Container(
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Row(children: [
                Container(
                    height: 100.adaptSize,
                    width: 100.adaptSize,
                    padding:
                        EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
                    decoration: AppDecoration.fillPrimary,
                    child: CustomImageView(
                        imagePath: ImageConstant.imgEllipse1,
                        height: 80.adaptSize,
                        width: 80.adaptSize,
                        radius: BorderRadius.circular(40.h),
                        alignment: Alignment.center)),
                Padding(
                    padding:
                        EdgeInsets.only(left: 15.h, top: 15.v, bottom: 15.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("lbl_christian_ha".tr,
                              style: CustomTextStyles.titleMediumBold),
                          SizedBox(height: 5.v),
                          RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_case_id2".tr,
                                    style: theme.textTheme.labelLarge),
                                TextSpan(
                                    text: "lbl_857881".tr,
                                    style: theme.textTheme.bodySmall)
                              ]),
                              textAlign: TextAlign.left),
                          SizedBox(height: 4.v),
                          GestureDetector(
                              onTap: () {
                                onTapFrameThirtySeven();
                              },
                              child: Row(children: [
                                RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "lbl_status".tr,
                                          style: theme.textTheme.labelLarge),
                                      TextSpan(
                                          text: "lbl_more_info".tr,
                                          style: CustomTextStyles
                                              .labelLargePrimary_1)
                                    ]),
                                    textAlign: TextAlign.left),
                                CustomImageView(
                                    imagePath: ImageConstant.imgEpInfoFilled,
                                    height: 10.adaptSize,
                                    width: 10.adaptSize,
                                    margin: EdgeInsets.only(
                                        left: 5.h, top: 4.v, bottom: 3.v))
                              ]))
                        ]))
              ])),
          SizedBox(height: 30.v),
          _buildFrameRow(
              userImage: ImageConstant.imgSettingsBlack900,
              appSettingsText: "lbl_tax_news".tr,
              onTapFrameRow: () {
                onTapFrame();
              }),
          SizedBox(height: 15.v),
          _buildFrameRow(
              userImage: ImageConstant.imgGroup18,
              appSettingsText: "lbl_app_settings".tr,
              onTapFrameRow: () {
                onTapFrameRow();
              }),
          SizedBox(height: 15.v),
          _buildFrameRow(
              userImage: ImageConstant.imgProfile,
              appSettingsText: "lbl_faq".tr,
              onTapFrameRow: () {
                onTapFrame1();
              }),
          SizedBox(height: 15.v),
          _buildFrameRow(
              userImage: ImageConstant.imgGroup18Black900,
              appSettingsText: "lbl_get_in_touch".tr,
              onTapFrameRow: () {
                onTapFrame2();
              }),
          SizedBox(height: 15.v),
          CustomTextFormField(
              controller: controller.signOutController,
              hintText: "lbl_sign_out".tr,
              hintStyle: theme.textTheme.titleMedium!,
              textInputAction: TextInputAction.done,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(20.h, 10.v, 15.h, 10.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgArrowdown,
                      height: 30.adaptSize,
                      width: 30.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 50.v),
              contentPadding:
                  EdgeInsets.only(top: 13.v, right: 30.h, bottom: 13.v),
              borderDecoration: TextFormFieldStyleHelper.outlineBlack)
        ]
        )
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }

  /// Common widget
  Widget _buildFrameRow({
    required String userImage,
    required String appSettingsText,
    Function? onTapFrameRow,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFrameRow!.call();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
            decoration: AppDecoration.outlineBlack900
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomImageView(
                  imagePath: userImage,
                  height: 30.adaptSize,
                  width: 30.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 15.h, top: 5.v),
                  child: Text(appSettingsText,
                      style: theme.textTheme.titleMedium!
                          .copyWith(color: appTheme.black900))),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowRightBlack900,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 5.v))
            ])));
  }

  /// Navigates to the statusScreen when the action is triggered.
  onTapFrameThirtySeven() {
    Get.toNamed(
      AppRoutes.statusScreen,
    );
  }

  /// Navigates to the taxNewsScreen when the action is triggered.
  onTapFrame() {
    Get.toNamed(
      AppRoutes.taxNewsScreen,
    );
  }

  /// Navigates to the appSettingsScreen when the action is triggered.
  onTapFrameRow() {
    Get.toNamed(
      AppRoutes.appSettingsScreen,
    );
  }

  /// Navigates to the faqScreen when the action is triggered.
  onTapFrame1() {
    Get.toNamed(
      AppRoutes.faqScreen,
    );
  }

  /// Navigates to the getInTouchScreen when the action is triggered.
  onTapFrame2() {
    Get.toNamed(
      AppRoutes.getInTouchScreen,
    );
  }
}
