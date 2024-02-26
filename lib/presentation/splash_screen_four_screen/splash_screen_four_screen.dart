import 'controller/splash_screen_four_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

// ignore_for_file: must_be_immutable
class SplashScreenFourScreen extends GetWidget<SplashScreenFourController> {
  const SplashScreenFourScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,

          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // CustomImageView(
                //   imagePath: ImageConstant.imgAnimation1701942247647,
                //   height: 150.adaptSize,
                //   width: 150.adaptSize,
                //   margin: EdgeInsets.only(right: 30),
                //   alignment: Alignment.centerRight,
                // ),
                CustomImageView(
                  imagePath: ImageConstant.imgCleartaxBrandLogo68x300,
                  height: 74.v,
                  width: 310.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    left: 17.h,
                    top: 21.v,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
