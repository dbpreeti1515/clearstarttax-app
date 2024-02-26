import 'controller/onboarding_screen_three_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreenThreeScreen
    extends GetWidget<OnboardingScreenThreeController> {
  const OnboardingScreenThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgBGThree,

                    ),
                    fit: BoxFit.cover

                )
            ),


            child: Stack(alignment: Alignment.topCenter, children: [
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: (){
                    onTapImgImage();
                  },
                  child: Container(
                    height: 100,
                    width: 100,

                  ),
                ),
              ),





            ]))
    );
  }

  /// Navigates to the loginPageScreen when the action is triggered.
  onTapImgImage() {
    Get.offAndToNamed(
      AppRoutes.loginPageScreen,
    );
    // Get.toNamed(
    //   AppRoutes.loginPageScreen,
    // );
  }
}
