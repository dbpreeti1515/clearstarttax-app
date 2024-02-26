import 'package:preeti_s_application3/data/apiModal/testmonialDescriptionModal.dart';

import '../controller/news_page_controller.dart';
import '../models/userprofile1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  Userprofile1ItemWidget(
    this.userprofile1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  testimonialDescriptionModal userprofile1ItemModelObj;

  var controller = Get.find<NewsPageController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          decoration: AppDecoration.outlineBlack900.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle51,
                height: 123.v,
                width: 180.h,
              ),
              SizedBox(height: 5.v),
              Text(userprofile1ItemModelObj.postTitle.toString()),
              // Container(
              //   width: 149.h,
              //   margin: EdgeInsets.only(left: 5.h),
              //   child: Obx(
              //     () => Text(
              //       userprofile1ItemModelObj.corporateTransparencyText!.value,
              //       maxLines: 3,
              //       overflow: TextOverflow.ellipsis,
              //       style: theme.textTheme.labelLarge,
              //     ),
              //   ),
              // ),
              SizedBox(height: 8.v),
              // Padding(
              //   padding: EdgeInsets.only(left: 5.h),
              //   child: Row(
              //     children: [
              //       Obx(
              //         () => Text(
              //           userprofile1ItemModelObj.readMoreText!.value,
              //           style: theme.textTheme.bodySmall,
              //         ),
              //       ),
              //       CustomImageView(
              //         imagePath: ImageConstant.imgArrowRightBlack900,
              //         height: 15.adaptSize,
              //         width: 15.adaptSize,
              //         margin: EdgeInsets.only(left: 5.h),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }
}
