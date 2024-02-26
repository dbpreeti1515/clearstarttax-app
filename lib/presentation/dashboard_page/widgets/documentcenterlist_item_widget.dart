import 'package:preeti_s_application3/presentation/HomeScreen/HomeScreen.dart';

import '../controller/dashboard_controller.dart';
import '../models/documentcenterlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class DocumentcenterlistItemWidget extends StatelessWidget {
  DocumentcenterlistItemWidget(
    this.documentcenterlistItemModelObj, {this.Index,
    Key? key,
  }) : super(
          key: key,
        );

  DocumentcenterlistItemModel documentcenterlistItemModelObj;
  int? Index;

  var controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

    Get.off(()=>documentcenterlistItemModelObj.routeName.value);

      },
      child: Container(
        decoration: AppDecoration.outlineBlack900.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          children: [
            Container(
              height: 100.adaptSize,
              width: 100.adaptSize,
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 25.v,
              ),
              decoration: AppDecoration.fillPrimary,
              child: Obx(
                () => CustomImageView(
                  imagePath: documentcenterlistItemModelObj.documentCenter!.value,
                  height: 50.adaptSize,
                  width: 50.adaptSize,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15.h,
                top: 12.v,
                bottom: 12.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      documentcenterlistItemModelObj.titleText!.value,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  SizedBox(
                    width: 223.h,
                    child: Obx(
                      () => Text(
                        documentcenterlistItemModelObj.descriptionText!.value,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
