import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:preeti_s_application3/presentation/HomeScreen/HomeScreen.dart';
import 'package:preeti_s_application3/presentation/get_in_touch_screen/get_in_touch_screen.dart';
import 'package:preeti_s_application3/presentation/news_page_screen/news_page_screen.dart';
import 'package:preeti_s_application3/presentation/payment_page/payment_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/pageSlider/page_slider_modal.dart';
import '../../widgets/comman_widget.dart';
import '../HomeScreen/controller/HomeScreenController.dart';
import '../dashboard_page/widgets/article_item_widget.dart';
import '../dashboard_page/widgets/documentcenterlist_item_widget.dart';
import '../dashboard_page/widgets/userprofile_item_widget.dart';
import '../splash_screen/controller/splash_screen_four_controller.dart';
import 'controller/dashboard_controller.dart';
import 'models/article_item_model.dart';
import 'models/dashboard_model.dart';
import 'models/documentcenterlist_item_model.dart';
import 'models/userprofile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_title_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
int value = -1;

class DashboardPage extends GetWidget<DashboardController> {
  DashboardPage({Key? key}) : super(key: key);
  DashboardController controller = Get.put(DashboardController());

  UserprofileItemModel userprofileItemModelObj = UserprofileItemModel();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar:
        CustomAppBar(
          leading:
         AppbarLeadingImage(
              imagePath: ImageConstant.imgSolarHamburgerMenuBroken,
              margin: EdgeInsets.all(mediaQueryData.size.width*.035),
              onTap: () {
                Scaffold.of(context).openDrawer();
                //onTapImage();
              }),

        ),
        body: Obx(() {
          return controller.getDashboardData.value == null ||
                  controller.testMonialData.value.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  width: mediaQueryData.size.width,
                  child:ScrollConfiguration(
                    behavior: ListScrollBehaviour(

                    ),
                    child: SingleChildScrollView(
                        padding: EdgeInsets.only(top: 19.v),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.h),
                            child: Column(children: [
                              CW.buildDashboardRow(
                                  text: "msg_welcome_back_to".tr +
                                      "\n\n" +
                                      "msg_explore_your_personalized".tr +
                                      name.value),
                              SizedBox(height: 12.v),
                              Column(children: [
                    
                                       Column(
                                          children: [
                                            Obx(() {
                                              return controller
                                                      .fqNotification.value && controller.isFQNotification.value==true
                                                  ? NotificationModal(context,
                                                      'lbl_fq_notification'.tr,
                                                      () async {
                                                    Get.toNamed(AppRoutes.fqScreen);
                                                      // var url =
                                                      //     'https://client.clearstarttax.com/fqs/app/${email.value}/${randomText1.value}${password}${randomText2.value}';
                                                      //
                                                      // if (await canLaunch(url)) {
                                                      //   await launch(url,
                                                      //       forceWebView: true,
                                                      //       enableJavaScript:
                                                      //           true);
                                                      // } else {
                                                      //   throw 'Could not launch $url';
                                                      // }
                                                    },value: 0)
                                                  : SizedBox();
                                            }),
                                            Obx(() {
                                              return controller
                                                      .toNotification.value&& controller.isToNotification.value==true
                                                  ? NotificationModal(context,
                                                      'lbl_to_notification'.tr,
                                                      () async {
                                                      // var url =
                                                      //     'https://client.clearstarttax.com/tos/app/${email.value}/${randomText2.value}${password}${randomText1.value}';
                                                      //
                                                      // if (await canLaunch(url)) {
                                                      //   await launch(url,
                                                      //       forceWebView: true,
                                                      //       enableJavaScript:
                                                      //           true);
                                                      // } else {
                                                      //   throw 'Could not launch $url';
                                                      // }
                                                        Get.toNamed(AppRoutes.toScreen);
                                                    },value: 1)
                                                  : SizedBox();
                                            }),
                                            Obx(() {
                                              return controller
                                                      .appoinmentNotification
                                                      .value&& controller.isAppointmentNotification.value==true
                                                  ? NotificationModal(
                                                      context,
                                                      'lbl_appoinment_notification'
                                                          .tr, () {
                                                      Get.offAllNamed(
                                                          AppRoutes.homeScreen);
                                                      selectedIndex.value = !paymentStatus.value == true?3:2;
                                                    },
                                                  value: 2)
                                                  : SizedBox();
                                            }),
                                          ],
                                        )
                                ,
                                _buildFrameNineColumn(),
                                SizedBox(height: 20.v),
                                _buildPageNavigation(
                                  context,
                                  ImageConstant.imgSolarDocumentAddOutline,
                                  "lbl_document_center".tr,
                                  "msg_view_and_upload".tr,
                                  (){
                                    Get.offAllNamed(  AppRoutes.homeScreen,);
                    
                                    selectedIndex.value= 1;
                                  }
                    
                                ),
                                SizedBox(
                                  height: 15.v,
                                ),
                                if(!paymentStatus.value == true)
                                _buildPageNavigation(
                                    context,
                                    ImageConstant.imgSettings,
                                    "lbl_payment_heading".tr,
                                    "msg_make_a_payment".tr,
                                        (){
                                      Get.offAllNamed(  AppRoutes.homeScreen,);
                    
                                      selectedIndex.value= 2;
                                    }
                                ),
                                if(!paymentStatus.value == true)
                                SizedBox(
                                  height: 15.v,
                                ),
                                if (controller.appoinmentNotification.value)
                                  _buildPageNavigation(
                                      context,
                                      ImageConstant.imgCalendar,
                                      "msg_schedule_an_appointment".tr,
                                      "msg_set_up_your_appointment".tr,
                                          (){
                                        Get.offAllNamed(  AppRoutes.homeScreen,);
                    
                                        selectedIndex.value=!paymentStatus.value == true?3:2;
                                      }
                                  ),
                                if (controller.appoinmentNotification.value)
                                  SizedBox(
                                    height: 15.v,
                                  ),
                                _buildPageNavigation(
                                    context,
                                    ImageConstant.imgSolarChatDotsBroken,
                                    "lbl_get_in_touch".tr,
                                    "msg_connect_with_your".tr,
                                        (){
                                      Get.toNamed(  AppRoutes.getInTouchScreen,);
                    
                    
                                    }
                                ),
                                SizedBox(
                                  height: 15.v,
                                ),
                                _buildPageNavigation(
                                    context,
                                    ImageConstant.imgProfile,
                                    "msg_faq_screen".tr,
                                    "lbl_faq_answer".tr,
                                        (){
                                      Get.toNamed(  AppRoutes.faqScreen,);
                    
                    
                                    }
                                ),
                                SizedBox(
                                  height: 15.v,
                                ),
                                _buildPageNavigation(
                                    context,
                                    ImageConstant.imgSettingsBlack900,
                    
                                    "lbl_tax_news".tr,
                                    "lbl_stay_update".tr,
                                        (){
                                      Get.toNamed(  AppRoutes.taxNewsScreen,);
                    
                    
                                    }
                                ),
                                SizedBox(height: 20.v),
                                _buildFrameColumn(),
                                SizedBox(height: 20.v),
                               //  pageSliderModal(),
                                // SizedBox(
                                //   height: 20.v,
                                // ),
                                CW.termCondition(satOfficerEmail.value),
                                SizedBox(
                                  height: 50.v,
                                ),
                              ])
                            ]))),
                  ));
        }));
  }

  Container NotificationModal(
    BuildContext context,
    text,
    VoidCallback? clickOnButton,{int? value}
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, top: 10),
      padding: EdgeInsets.only(left: 20.h, top: 10.v, bottom: 10.h),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Color(0xFF00AAD8),
        ),
        color: ColorSchemes.primaryColorScheme.inversePrimary,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height:value==1||value==0? MediaQuery.sizeOf(context).height * 0.048:
                MediaQuery.sizeOf(context).height * 0.068,
                width: MediaQuery.of(context).size.width * 0.68,
                child: SizedBox.expand(
                  //    width: MediaQuery.of(context).size.width*0.68,
                  child: Text(
                    text,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(30, 20),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: clickOnButton,
                  child: Text("lbl_click_here".tr,
                      textAlign: TextAlign.left,
                      style: CustomTextStyles.bodyMediumPrimary
                          .copyWith(color: theme.colorScheme.onError)))
            ],
          ),
          IconButton(
            onPressed: () {
              controller.onClickNotification(value);
            },
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(top: 0, right: 8),
            icon: SvgPicture.asset(
              ImageConstant.imgDashboardCross,
              color: Colors.black,
              height: 15,
              width: 15,
            ),
            color: Colors.black,
          )
        ],
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 70.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgSolarHamburgerMenuBroken,
            margin: EdgeInsets.only(left: 30.h, top: 20.v, bottom: 15.v),
            onTap: () {}),
        title: Container(
            height: 67.v,
            width: 246.26001.h,
            margin: EdgeInsets.only(left: 32.h),
            child: Stack(alignment: Alignment.topLeft, children: [
              AppbarTitleImage(
                  imagePath: ImageConstant.imgImage2,
                  margin: EdgeInsets.only(left: 22.h, top: 17.v)),
            ])),
        styleType: Style.bgShadow);
  }

  /// Section Widget
  Widget _buildFrameNineColumn() {
    return Container(
        decoration: AppDecoration.outlineBlack900
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return controller.getDashboardData.value != null
                    ? CW.statusCard(
                        text: "msg_your_case_status".tr +
                                controller.getDashboardData.value!.data!
                                    .statusName! ??
                            '',
                        height: 100.h)
                    : SizedBox();
              }),

              SizedBox(height: 19.v),
              Obx(() {
                return controller.getDashboardData.value != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 20.h, right: 39.h),
                        child: _buildYourNextStepsRow(
                            yourNextStepsText: "msg_what_this_means".tr,
                            detailsShownHereText: controller.getDashboardData
                                    .value!.data!.statusinfo!.whatThisMeans ??
                                ''))
                    : SizedBox();
              }),

              SizedBox(height: 20.v),
              Obx(() {
                return controller.getDashboardData.value != null
                    ? Padding(
                        padding: EdgeInsets.only(left: 20.h, right: 39.h),
                        child: _buildYourNextStepsRow(
                            yourNextStepsText: "msg_your_next_steps".tr,
                            detailsShownHereText: controller.getDashboardData
                                    .value!.data!.statusinfo!.whatHappensNext ??
                                ''))
                    : SizedBox();
              }),

              SizedBox(height: 17.v),
              // Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 10.h),
              //     child: _buildCompleteOnlineRow(
              //         completeOnlineText: "msg_complete_online".tr,
              //         clickHereText: "lbl_click_here".tr,
              //         url: 'https://clearstarttax.com/toform/')),
              // SizedBox(height: 20.v),
              // Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 10.h),
              //     child: _buildCompleteOnlineRow(
              //         completeOnlineText: "msg_complete_online2".tr,
              //         clickHereText: "lbl_click_here".tr,
              //         url: 'https://clearstarttax.com/fqform/')),
              // SizedBox(height: 35.v)
            ]));
  }

  Widget _buildPageNavigation(
      BuildContext context, String image, String heading, String text, GestureTapCallback name,
      {RxInt? index}) {
    return GestureDetector(
      onTap: name,
      // onTap: () {
      //
      //
      //   selectedIndex.value = index?.value ?? 0;
      //   Get.toNamed(name);
      //  // Get.offNamed(name);
      // },
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
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        10,
                      ),
                      topLeft: Radius.circular(
                        10,
                      ))),
              child: CustomImageView(
                radius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      10,
                    ),
                    topLeft: Radius.circular(
                      10,
                    )),
                imagePath: image,
                height: 50.adaptSize,
                width: 50.adaptSize,
                alignment: Alignment.center,
                color: Colors.white,
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
                  Text(
                    heading,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 9.v),
                  SizedBox(
                    width: 223.h,
                    child: Text(
                      text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium,
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
  Widget _buildEightyColumn() {
    return Obx(() {
      return controller.testMonialDataLenght.value != 0
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("lbl_our_tax_news".tr,
                  style: CustomTextStyles.titleMediumPrimary),
              SizedBox(height: 9.v),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.v);
                  },
                  itemCount: controller.testMonialDataLenght.value,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => NewsPageScreen(id:controller.testMonialData
                            .value[index]['ID']));

                       // Get.toNamed(AppRoutes.newsPageScreen);
                        // Get.off(() => NewsPageScreen(
                        //       id: controller.testMonialData.value[index]['ID'],
                        //     ));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 1.v),
                        decoration: AppDecoration.outlineBlack900.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Row(
                          children: [
                            Obx(
                              () => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10))),
                                child: CustomImageView(
                                  radius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                        10,
                                      ),
                                      topLeft: Radius.circular(
                                        10,
                                      )),
                                  imagePath: controller.testMonialData
                                          .value[index]['image'] ??
                                      '',
                                  height: 100.v,
                                  width: 146.h,
                                  fit: BoxFit.cover,
                                ),
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
                                        controller.testMonialData
                                            .value[index]['post_title']
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
                                    //  Get.toNamed(AppRoutes.newsPageScreen);
                                      Get.to(() => NewsPageScreen(id:controller.testMonialData
                                          .value[index]['ID']));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "msg_read_more".tr,
                                          style:
                                              CustomTextStyles.bodySmallOnError,
                                        ),
                                        CustomImageView(
                                          imagePath:
                                              ImageConstant.imgArrowRight,
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
                  }),
              SizedBox(height: 9.v),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.taxNewsScreen);
                    },
                    child: Text("lbl_view_more".tr,
                        style: CustomTextStyles.titleSmallPrimary),
                  ))
            ])
          : SizedBox();
    });
  }

  /// Section Widget
  Widget _buildFrameColumn() {
    return Container(
        decoration: AppDecoration.fillOnPrimaryContainer
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          if (controller.testMonialDataLenght.value != 0) _buildEightyColumn(),
        ]));
  }

  ///Card Widget
  Widget CardFrame() {
    return PageView.builder(
      controller: controller.pageController.value,
      itemCount: 5, // Set the number of cards
      itemBuilder: (context, index) {
        // Calculate the rotation value based on the position of the card
        double rotation = (index - controller.currentPage.value) * 0.2;

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001) // Perspective
            ..rotateY(rotation), // Apply rotation
          child: Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Card $index',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Common widget
  Widget _buildYourNextStepsRow({
    required String yourNextStepsText,
    required String detailsShownHereText,
  }) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Text(
                yourNextStepsText,
                style: theme.textTheme.titleMedium!
                    .copyWith(color: appTheme.black900),
                textAlign: TextAlign.left,
              )),
          Text(detailsShownHereText,
              style: CustomTextStyles.bodyMediumOnError
                  .copyWith(color: theme.colorScheme.onError))
        ]);
  }

  final List<Widget> imageSliders = imgList.map((item) {

    return SizedBox(
      //  width: double.maxFinite,
      //height: 500.v,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 213.h,
          height: 255,
          margin: EdgeInsets.only(bottom: 10.v, top: 10.h),
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 10.v,
          ),
          decoration: AppDecoration.outlineBlack9001.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CustomImageView(
              //   imagePath: imgList[value],
              //   height: 80.adaptSize,
              //   width: 80.adaptSize,
              //   radius: BorderRadius.circular(
              //     40.h,
              //   ),
              // ),
              // SizedBox(height: 14.v),
              Text(
                " Andrew C.",
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 5.v),
              SizedBox(
                width: 179.h,
                child: Text(
                  "“It’s just so much of a relief you know? Somebody going through a major debt crisis I would say: take care of it now. Don’t wait for them to take your stuff. “",

                  // overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }).toList();
}

/// Navigates to the settingsScreen when the action is triggered.

final List<String> imgList = [
  'assets/images/img_ellipse_5.png',
  'assets/images/img_ellipse_6.png',
  'assets/images/img_ellipse_6_1.png',
  'assets/images/img_ellipse_6_80x80.png'
];
