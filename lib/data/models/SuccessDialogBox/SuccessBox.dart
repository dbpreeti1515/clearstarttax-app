import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

import '../../../core/utils/image_constant.dart';
import '../../../widgets/custom_image_view.dart';

class SuccessDialog {
  static void showCustomDialog(
      BuildContext context, String heading, String text, bool doubleNavigator) {
    showDialog(
      context: context,

      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.only(bottom: 0, right: 5),
          buttonPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgGIF,
                height: 170.v,
                width: 172.h,
                alignment: Alignment.topCenter,
              ),
              Container(
                width: 225.h,
                margin: EdgeInsets.only(bottom: 5.v),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: heading,
                        style: CustomTextStyles.headlineSmallBold,
                      ),
                      TextSpan(
                        text: text,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
               
                  Get.back(); // Close the dialog
                },
                child: Text(
                  'OK',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
