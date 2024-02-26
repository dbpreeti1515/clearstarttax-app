import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "Splash screen One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreenOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Payment Schedule".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.paymentScheduleScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Splash screen Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreenTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Splash screen Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.splashScreenThreeScreen),
                        ),_buildScreenTitle(
                          screenTitle: "Home Screen".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.homeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Splash screen Four".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.splashScreenFourScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Onboarding Screen One".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboardingScreenOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Onboarding Screen Two".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboardingScreenTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Onboarding Screen Three".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onboardingScreenThreeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Login page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginPageScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Signup".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signupScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Dashboard - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.dashboardContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Document".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.documentScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Payment - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.paymentTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Appionment".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.appionmentScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "FAQ".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.faqScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Get in touch".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.getInTouchScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Tax News".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.taxNewsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Status".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.statusScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Settings".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.settingsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "News Page".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.newsPageScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "App Settings".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.appSettingsScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Forget Password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.forgetPasswordScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Upload Success".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.uploadSuccessScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Appointment".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.appointmentScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Reset Password".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.resetPasswordScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Payment Success".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.paymentSuccessScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Message sent".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.messageSentScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
