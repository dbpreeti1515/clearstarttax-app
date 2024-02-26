import '../controller/tax_news_controller.dart';
import '../models/newsarticle_item_model.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class NewsarticleItemWidget extends StatelessWidget {
  NewsarticleItemWidget(
    this.newsarticleItemModelObj, {
    Key? key,
    this.onTapFrameEighteen,
  }) : super(
          key: key,
        );

  NewsarticleItemModel newsarticleItemModelObj;

  var controller = Get.find<TaxNewsController>();

  VoidCallback? onTapFrameEighteen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.v),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        children: [
          Obx(
            () => CustomImageView(
              imagePath: newsarticleItemModelObj.articleImage!.value,
              height: 100.v,
              width: 146.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.h,
              top: 9.v,
              bottom: 9.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 179.h,
                  child: Obx(
                    () => Text(
                      newsarticleItemModelObj.articleTitle!.value,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                SizedBox(height: 9.v),
                GestureDetector(
                  onTap: () {
                    onTapFrameEighteen!.call();
                  },
                  child: Row(
                    children: [
                      Obx(
                        () => Text(
                          newsarticleItemModelObj.readMoreText!.value,
                          style: CustomTextStyles.bodySmallOnError,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrowRight,
                        height: 15.adaptSize,
                        width: 15.adaptSize,
                        margin: EdgeInsets.only(left: 5.h),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
