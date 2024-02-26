import 'controller/onboarding_screen_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreenTwoScreen
    extends GetWidget<OnboardingScreenTwoController> {
  const OnboardingScreenTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageConstant.imgBGTwo,

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

  /// Navigates to the onboardingScreenThreeScreen when the action is triggered.
  onTapImgImage() {
    Get.toNamed(
      AppRoutes.onboardingScreenThreeScreen,
    );
  }
}
