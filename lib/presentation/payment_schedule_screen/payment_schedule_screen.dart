import 'controller/payment_schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class PaymentScheduleScreen extends GetWidget<PaymentScheduleController> {
  const PaymentScheduleScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 360.h,
          child: Column(
            children: [
              SizedBox(
                height: 336.v,
                width: 360.h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup10,
                      height: 288.v,
                      width: 10.h,
                      alignment: Alignment.bottomRight,
                    ),
                    _buildPaymentScheduleFrameTwentySix(),
                    _buildPaymentScheduleThree(),
                  ],
                ),
              ),
              SizedBox(height: 19.v),
              _buildPaymentScheduleTwo(),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildCloseButton(),
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentScheduleFrameTwentySix() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.fromLTRB(63.h, 4.v, 63.h, 3.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.v),
            Text(
              "msg_payment_schedule".tr,
              style: CustomTextStyles.headlineSmallOnPrimaryContainer,
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentScheduleThree() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 30.h,
          bottom: 4.v,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_date".tr,
              priceText: "lbl_amount".tr,
            ),
            SizedBox(height: 2.v),
            _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_11_04_2021".tr,
              priceText: "lbl_595_00".tr,
            ),
            SizedBox(height: 5.v),
            _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_03_29_2023".tr,
              priceText: "lbl_1_378_90".tr,
            ),
            SizedBox(height: 5.v),
            _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_04_08_2023".tr,
              priceText: "lbl_1_378_90".tr,
            ),
            SizedBox(height: 5.v),
            _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_05_08_2023".tr,
              priceText: "lbl_1_378_90".tr,
            ),
            SizedBox(height: 5.v),
            _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_06_08_2023".tr,
              priceText: "lbl_1_378_90".tr,
            ),
            SizedBox(height: 5.v),
            _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_07_08_2023".tr,
              priceText: "lbl_1_378_90".tr,
            ),
            SizedBox(height: 5.v),
            _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_08_08_2023".tr,
              priceText: "lbl_1_378_90".tr,
            ),
            SizedBox(height: 5.v),
            _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_06_08_2023".tr,
              priceText: "lbl_1_378_90".tr,
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPaymentScheduleTwo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 49.h),
            child: Text(
              "msg_upcoming_payments".tr,
              style: CustomTextStyles.titleLargeBlack900,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_09_08_2023".tr,
              priceText: "lbl_595_00".tr,
            ),
          ),
          SizedBox(height: 5.v),
          Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_10_08_2023".tr,
              priceText: "lbl_1_378_90".tr,
            ),
          ),
          SizedBox(height: 5.v),
          Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_11_08_2023".tr,
              priceText: "lbl_1_378_90".tr,
            ),
          ),
          SizedBox(height: 5.v),
          Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: _buildPaymentScheduleFrameFortySeven(
              dateText: "lbl_11_08_2023".tr,
              priceText: "lbl_1_378_90".tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCloseButton() {
    return CustomElevatedButton(
      width: 200.h,
      text: "lbl_close".tr,
      margin: EdgeInsets.only(
        left: 80.h,
        right: 80.h,
        bottom: 18.v,
      ),
    );
  }

  /// Common widget
  Widget _buildPaymentScheduleFrameFortySeven({
    required String dateText,
    required String priceText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          dateText,
          style: theme.textTheme.titleMedium!.copyWith(
            color: appTheme.black900,
          ),
        ),
        Text(
          priceText,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }
}
