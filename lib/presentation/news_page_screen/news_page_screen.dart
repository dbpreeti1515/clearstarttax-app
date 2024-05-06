

import 'package:flutter/cupertino.dart';
import 'package:preeti_s_application3/data/apiModal/testmonialDescriptionModal.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../data/models/pageSlider/page_slider_modal.dart';
import '../../widgets/comman_widget.dart';
import '../dashboard_page/controller/dashboard_controller.dart';
import '../news_page_screen/widgets/userprofile1_item_widget.dart';
import '../news_page_screen/widgets/userprofile2_item_widget.dart';
import 'controller/news_page_controller.dart';
import 'models/userprofile1_item_model.dart';
import 'models/userprofile2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_title_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:preeti_s_application3/widgets/custom_bottom_bar.dart';

class NewsPageScreen extends GetWidget<NewsPageController> {
  int? id;
  NewsPageScreen({Key? key, this.id}) : super(key: key){





    controller.testimonialDescriptionId.value = id??0;

     controller.TestimonialDescriptionAPI( controller.testimonialDescriptionId.value);
   //  controller.updateHeight();


  }
  NewsPageController controller = Get.put(NewsPageController());

  int value = 0;
  @override
  Widget build(BuildContext context) {
    late Future<List<testimonialDescriptionModal>> testimonialDescription;
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
          return controller.testimonialDescriptionData.value.isEmpty
              ? Center(child: CircularProgressIndicator())
              : SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      children: [
                    SizedBox(height: 7.v),
                    Expanded(
                        child: ScrollConfiguration(
                          behavior: ListScrollBehaviour(

                          ),
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 0.h),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 3.v),
                                        if(controller.webController!=null)


                                        _buildFiftyNine(),
                                        SizedBox(height: 10.v),
                                        Obx(() => Align(
                                            alignment: Alignment.center,
                                            child: Container(

                                                height:controller.contentheight.value,
                                                margin: EdgeInsets.only(
                                                    left: 20.h, right: 20.h),
                                                child: WebViewWidget(
                                                  controller: controller.webController!,

                                                ).marginZero)),),

                                        SizedBox(height: 7.v),
                                        Container(
                                            margin: EdgeInsets.only(
                                                           left: 20.h, right: 20.h,top: 0),
                                            height:controller.contentheight1.value,
                                            child: WebViewWidget(
                                                controller: controller.webController1!)),

                                        SizedBox(height: 11.v),
                                        SizedBox(height: 10.v),
                                        Padding(
                                            padding: EdgeInsets.only(left: 31.h),
                                            child: Text("lbl_recent_post".tr,
                                                style: CustomTextStyles
                                                    .titleMediumPrimary)),
                                        SizedBox(height: 12.v),

                                        _buildUserProfile(),
                                        // SizedBox(height: 10.v),
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(horizontal: 25),
                                        //   child: pageSliderModal(
                                        //
                                        //   ),
                                        // ),
                                        SizedBox(height: 20.v,),
                                        CW.termCondition(satOfficerEmail.value),
                                        SizedBox(height: 60.v,),
                                      ]))),
                        ))
                  ]));
        }));
  }

  /// Section Widget
  Widget _buildFiftyNine() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Obx(() {
        return

             Container(
                width: mediaQueryData.size.width,
                margin: EdgeInsets.only(left: 31.h, right: 48.h),
                child: Text(
                    controller.testimonialDescriptionData.value[value]
                            ['post_title'] ??
                        '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    )));
      }),
      SizedBox(height: 7.v),
      CustomImageView(
        imagePath:
            controller.testimonialDescriptionData.value[value]['image'] ?? '',
        height: 500.v,
        width: mediaQueryData.size.width,
        margin: EdgeInsets.symmetric(horizontal: 2),
        fit: BoxFit.cover,
      )
    ]);
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Obx((){
      return controller.testimonialRelatedData.value.isNotEmpty?
      Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
              height: 225.v,
              child: Obx(() => ListView.separated(
                  padding: EdgeInsets.only(left: 31.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 15.h);
                  },
                  itemCount: controller.testimonialRelatedData.value.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 220.h,
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
                                imagePath: controller
                                    .testimonialRelatedData.value[index]['image']
                                    .toString(),
                                fit: BoxFit.cover,
                                height: mediaQueryData.size.height * .137,
                                width: mediaQueryData.size.width,
                                radius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              SizedBox(height: 5.v),
                              Container(
                                width: mediaQueryData.size.width,
                                margin: EdgeInsets.only(left: 10.h),
                                child: Obx(
                                      () => Text(
                                    controller.testimonialRelatedData
                                        .value[index]['post_title']
                                        .toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.labelLarge!.copyWith(
                                        height: 1.3
                                    ),

                                  ),
                                ),
                              ),
                              SizedBox(height: 8.v),
                              TextButton(


                                style:TextButton.styleFrom(

                                  minimumSize: Size(20, 15),
                                  padding: EdgeInsets.only(left: 5, top: 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: (){


                                  controller.webController?.loadRequest(Uri.parse("about:blank"));
                                 

                                  // Get.off(() => NewsPageScreen(id:controller.testimonialDescriptionData.value[0]['ID']));
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewsPageScreen(id:controller.testimonialRelatedData.value[index]['ID']),));
                                },

                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.h),
                                  child: Row(
                                    children: [
                                      Text(
                                        "msg_read_more".tr,
                                        style: theme.textTheme.bodySmall!.copyWith(
                                            color: theme.primaryColor

                                      )),
                                      CustomImageView(
                                        imagePath:
                                        ImageConstant.imgArrowRightBlack900,
                                        color: theme.primaryColor,
                                        height: 15.adaptSize,
                                        width: 15.adaptSize,
                                        margin: EdgeInsets.only(left: 5.h),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.v),
                            ],
                          ),
                        ),
                      ),
                    );
                  }))))
          :SizedBox();
    });
  }

  /// Section Widget

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImage() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
