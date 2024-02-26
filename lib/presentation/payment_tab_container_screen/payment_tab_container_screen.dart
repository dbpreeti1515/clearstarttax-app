import 'controller/payment_tab_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/payment_page/payment_page.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_title_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:preeti_s_application3/widgets/custom_bottom_bar.dart';
import 'package:preeti_s_application3/widgets/custom_elevated_button.dart';
import 'package:preeti_s_application3/widgets/custom_radio_button.dart';

class PaymentTabContainerScreen
    extends GetWidget<PaymentTabContainerController> {
  const PaymentTabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 19.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.h),
                              child: Column(children: [
                                _buildFrameTwentySix(),
                                SizedBox(height: 20.v),
                                _buildFrameNine(),
                                SizedBox(height: 20.v),
                                _buildFrameTwentySeven(),
                                SizedBox(height: 20.v),
                                _buildComponentSeventeen()
                              ]))))
                ])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 70.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgSolarHamburgerMenuBroken,
            margin: EdgeInsets.only(left: 30.h, top: 20.v, bottom: 15.v),
            onTap: () {
              onTapImage();
            }),
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
  Widget _buildFrameTwentySix() {
    return Padding(
        padding: EdgeInsets.only(left: 4.h, right: 5.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("msg_hello_christian".tr,
                style: CustomTextStyles.titleMediumSourceSerif4OnError),
            SizedBox(height: 5.v),
            SizedBox(
                width: 231.h,
                child: Text("msg_step_into_your".tr,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargePrimary))
          ]),
          CustomImageView(
              imagePath: ImageConstant.imgFloridWebWall,
              height: 100.adaptSize,
              width: 100.adaptSize)
        ]));
  }

  /// Section Widget
  Widget _buildFrameNine() {
    return Container(
        decoration: AppDecoration.outlineBlack
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 139.h, vertical: 12.v),
              decoration: AppDecoration.fillPrimary,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(height: 5.v),
                Text("lbl_payment".tr,
                    style: CustomTextStyles.titleMediumOnPrimaryContainer18)
              ])),
          SizedBox(height: 18.v),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 15.h),
              decoration:
                  BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder5),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => CustomRadioButton(
                          text: "msg_past_due_balance".tr,
                          value: "msg_past_due_balance".tr,
                          groupValue: controller.radioGroup.value,
                          onChange: (value) {
                            controller.radioGroup.value = value;
                          })),
                      Text("lbl_8_836_02".tr, style: theme.textTheme.bodyLarge)
                    ]),
                SizedBox(height: 6.v),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Padding(
                          padding: EdgeInsets.only(top: 1.v),
                          child: CustomRadioButton(
                              text: "msg_remaining_balance".tr,
                              value: "msg_remaining_balance".tr,
                              groupValue: controller.radioGroup1.value,
                              onChange: (value) {
                                controller.radioGroup1.value = value;
                              }))),
                      Text("lbl_17_051_62".tr, style: theme.textTheme.bodyLarge)
                    ]),
                SizedBox(height: 4.v),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => CustomRadioButton(
                          text: "lbl_other_amount".tr,
                          value: "lbl_other_amount".tr,
                          groupValue: controller.radioGroup2.value,
                          onChange: (value) {
                            controller.radioGroup2.value = value;
                          })),
                      Text("lbl4".tr, style: theme.textTheme.bodyLarge)
                    ])
              ])),
          SizedBox(height: 18.v)
        ]));
  }

  /// Section Widget
  Widget _buildFrameTwentySeven() {
    return Container(
        decoration: AppDecoration.outlineBlack
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 106.h, vertical: 12.v),
              decoration: AppDecoration.fillPrimary,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 4.v),
                    Text("msg_billing_summary".tr,
                        style: CustomTextStyles.titleMediumOnPrimaryContainer18)
                  ])),
          SizedBox(height: 18.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: _buildFrameThirtyNine(
                  paidLabel: "lbl_total_balance".tr,
                  priceLabel: "lbl_17_084_00".tr)),
          SizedBox(height: 5.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: _buildFrameThirtyNine(
                  paidLabel: "lbl_paid".tr, priceLabel: "lbl_32_38".tr)),
          SizedBox(height: 6.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: _buildFrameThirtyNine(
                  paidLabel: "lbl_paid2".tr, priceLabel: "lbl_0_19".tr)),
          SizedBox(height: 6.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: _buildFrameThirtyNine(
                  paidLabel: "msg_remaining_balance2".tr,
                  priceLabel: "lbl_17_051_62".tr)),
          SizedBox(height: 4.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: _buildFrameThirtyNine(
                  paidLabel: "lbl_amount_due".tr,
                  priceLabel: "lbl_10_214_92".tr)),
          SizedBox(height: 5.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: _buildFrameThirtyNine(
                  paidLabel: "lbl_next_due_date".tr,
                  priceLabel: "lbl_09_08_2023".tr)),
          SizedBox(height: 6.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: _buildFrameThirtyNine(
                  paidLabel: "lbl_past_due".tr, priceLabel: "lbl_8_836_02".tr)),
          SizedBox(height: 5.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: _buildFrameThirtyNine(
                  paidLabel: "lbl_pay_schedule".tr,
                  priceLabel: "lbl_click_to_view".tr,
                  onTapPrice: () {
                    onTapTxtClickToView();
                  })),
          SizedBox(height: 16.v)
        ]));
  }

  /// Section Widget
  Widget _buildComponentSeventeen() {
    return Container(
        decoration: AppDecoration.outlineBlack9002
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CustomElevatedButton(
              height: 57.v,
              text: "msg_payment_information".tr,
              buttonStyle: CustomButtonStyles.fillPrimary1,
              buttonTextStyle:
                  CustomTextStyles.titleMediumOnPrimaryContainer18),
          SizedBox(height: 20.v),
          Container(
              height: 48.v,
              width: 305.h,
              child: TabBar(
                  controller: controller.tabviewController,
                  labelPadding: EdgeInsets.zero,
                  labelColor: appTheme.black900,
                  labelStyle: TextStyle(
                      fontSize: 16.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  unselectedLabelColor: appTheme.black900,
                  unselectedLabelStyle: TextStyle(
                      fontSize: 16.fSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500),
                  indicator: BoxDecoration(
                      color: theme.colorScheme.onPrimaryContainer
                          .withOpacity(0.23),
                      border: Border(
                          bottom: BorderSide(
                              color: appTheme.gray600.withOpacity(0.55),
                              width: 1.h))),
                  tabs: [
                    Tab(child: Text("lbl_credit_card".tr)),
                    Tab(child: Text("lbl_bank_transfer".tr))
                  ])),
          SizedBox(
              height: 721.v,
              child: TabBarView(
                  controller: controller.tabviewController,
                  children: [
                    PaymentPage(),
                    PaymentPage()
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }

  /// Common widget
  Widget _buildFrameThirtyNine({
    required String paidLabel,
    required String priceLabel,
    Function? onTapPrice,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(paidLabel,
          style:
              theme.textTheme.titleMedium!.copyWith(color: appTheme.black900)),
      GestureDetector(onTap: () {
        onTapPrice!.call();
      }),
      Text(priceLabel,
          style: theme.textTheme.bodyLarge!.copyWith(color: appTheme.black900))
    ]);
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImage() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }

  /// Navigates to the paymentScheduleScreen when the action is triggered.
  onTapTxtClickToView() {
    Get.toNamed(
      AppRoutes.paymentScheduleScreen,
    );
  }
}
