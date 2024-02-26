import '../controller/dashboard_controller.dart';
import '../models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget(
    this.userprofileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofileItemModel userprofileItemModelObj;

  var controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 213.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.only(bottom: 50.v),
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 13.v,
          ),
          decoration: AppDecoration.outlineBlack9001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => CustomImageView(
                  imagePath: userprofileItemModelObj.userImage!.value,
                  height: 80.adaptSize,
                  width: 80.adaptSize,
                  radius: BorderRadius.circular(
                    40.h,
                  ),
                ),
              ),
              SizedBox(height: 14.v),
              Obx(
                () => Text(
                  userprofileItemModelObj.andrewC!.value,
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 5.v),
              SizedBox(
                width: 179.h,
                child: Obx(
                  () => Text(
                    userprofileItemModelObj.description!.value,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
