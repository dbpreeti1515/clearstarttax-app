import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:preeti_s_application3/presentation/news_page_screen/news_page_screen.dart';

import '../../widgets/comman_widget.dart';
import '../HomeScreen/HomeScreen.dart';
import '../dashboard_page/controller/dashboard_controller.dart';
import '../tax_news_screen/widgets/newsarticle_item_widget.dart';
import 'controller/tax_news_controller.dart';
import 'models/newsarticle_item_model.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_title_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:preeti_s_application3/widgets/custom_bottom_bar.dart';

class TaxNewsScreen extends GetWidget<TaxNewsController> {
   TaxNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
              appBar:  CustomAppBar(
                // leadingWidth: mediaQueryData.size.width*.126,

                leading:
                AppbarLeadingImage(
                    imagePath: ImageConstant.imgbackButton,


                    margin: EdgeInsets.all(mediaQueryData.size.width*.05),
                    onTap: () {
                      Get.back();
                      //  Get.offAllNamed(AppRoutes.homeScreen);
                    }),

              ),
              body: Obx(() {
                return controller.isLoading.value
                    ? Center(
                    child: CircularProgressIndicator(
                      color: theme.primaryColor,
                    ))
                    : SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(height: 19.v),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 30.h, right: 30.h, bottom: 5.v),
                              child: Column(children: [
                                CW.buildDashboardRow(
                                    text: "msg_heading".tr),

                                SizedBox(height: 16.v),
                                _buildNewsArticle(),
                                SizedBox(height: 20.v,),
                                CW.termCondition(satOfficerEmail.value),
                                SizedBox(height: 50.v,),
                              ])))
                    ]));
              })

      );

  }

  final PagingController _pagingController =
  PagingController(firstPageKey: 0);
  Widget pageniation(){

    return SizedBox(
      height: 400,
      child: PagedListView(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) =>
              TestimonialModal(index),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildNewsArticle() {
    return Obx(() {
      return  SizedBox(
        height: mediaQueryData.size.height * 0.55,
        child:  ScrollConfiguration(
          behavior: ListScrollBehaviour(

          ),
          child: Scrollbar(
            showTrackOnHover: true,
            thumbVisibility: true,


            controller:
            controller.scrollController,
            scrollbarOrientation:   ScrollbarOrientation.right,
            thickness: 5,
            radius: Radius.circular(5),
            trackVisibility: true,

            child: ListView.separated(
                padding: EdgeInsets.only(
                    left: 5, right: 20, top: 5, bottom: 5),

                controller:
                controller.scrollController,



                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 15.v);
                },

                itemCount: controller.testMonialData.length,
                itemBuilder: (context, index) {
                  return TestimonialModal(index);
                }),
          ),
        ),
      );
    });
  }

  GestureDetector TestimonialModal(int index) {
    return GestureDetector(
            onTap: () {
              onTapFrameEighteen.call(controller.testMonialData.value[index]['ID']);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.v),
              decoration: AppDecoration.outlineBlack900.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),

                child: Row(
                  children: [
                    Obx(
                      () => CustomImageView(
                        imagePath: controller.testMonialData.value[index]
                            ['image'],
                        radius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        height: 100.v,
                        width: 146.h,
                        fit: BoxFit.cover,
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
                                controller
                                    .testMonialData.value[index]['post_title']
                                    .toString(),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.labelLarge,
                              ),
                            ),
                          ),
                          SizedBox(height: 9.v),
                          GestureDetector(
                            onTap: () {
                              onTapFrameEighteen.call(controller.testMonialData.value[index]['ID']);
                            },
                            child: Row(
                              children: [
                                Text(
                                  "msg_read_more".tr,
                                  style: CustomTextStyles.bodySmallOnError,
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

            ),
          );
  }

  /// Section Widget

  /// Navigates to the newsPageScreen when the action is triggered.
  onTapFrameEighteen(int postId) {

    Get.to(()=>NewsPageScreen(id: postId,));
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImage() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
}
