import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/appionment_screen/appionment_screen.dart';
import 'package:preeti_s_application3/presentation/dashboard_page/controller/dashboard_controller.dart';
import 'package:preeti_s_application3/presentation/dashboard_page/dashboard_page.dart';
import 'package:preeti_s_application3/presentation/document_screen/document_screen.dart';
import 'package:preeti_s_application3/presentation/payment_page/payment_page.dart';
import 'package:preeti_s_application3/presentation/status_screen/status_screen.dart';

import '../../core/utils/image_constant.dart';
import '../../data/apiModal/getDashboardModal.dart';
import '../../widgets/app_bar/appbar_title_image.dart';
import '../splash_screen_four_screen/controller/splash_screen_four_controller.dart';
import 'controller/HomeScreenController.dart';
import 'controller/HomeScreenController.dart';

class Homescreen extends GetWidget {

  bool? isAppoinment;
  int? selectedIndexValue;
  GetDashBoardModel? getDashboardData;

  Homescreen({ this.selectedIndexValue,this.isAppoinment,  this.getDashboardData}) {
    _controller.appoinmentNotification.value = isAppoinment??false;

    print("thi is ${_controller.appoinmentNotification.value} and ${isAppoinment}");

    _controller.currentIndex.value = selectedIndexValue??0;
  }

  final HomeScreenController _controller = Get.put(HomeScreenController());

   PersistentTabController tabController = PersistentTabController(initialIndex: selectedIndex.value);


   List<Widget> _pages() {
    return [
      DashboardPage(),
      DocumentScreen(),
      PaymentPage(),
      if(_controller.appoinmentNotification.value==true)
      AppionmentScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(ImageConstant.imgDashboard,
              height: 30, width: 30, color: theme.primaryColor),
          iconSize: 30,
          title: ("Dashboard"),
          activeColorPrimary: theme.secondaryHeaderColor,
          activeColorSecondary: theme.primaryColor,
          inactiveColorPrimary: Colors.black,
          inactiveIcon: SvgPicture.asset(
            ImageConstant.imgDashboard,
            height: 30,
            width: 30,
          )),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(ImageConstant.imgDocument,
              height: 25, width: 25, color: theme.primaryColor),
          title: ("Document"),
          activeColorPrimary: theme.secondaryHeaderColor,
          activeColorSecondary: theme.primaryColor,
          inactiveColorPrimary: Colors.black,
          inactiveIcon: SvgPicture.asset(
            ImageConstant.imgDocument,
            height: 30,
            width: 30,
          )),
      PersistentBottomNavBarItem(
          icon: SvgPicture.asset(ImageConstant.imgCamera,
              height: 25, width: 25, color: theme.primaryColor),
          title: ("Payment"),
          activeColorPrimary: theme.secondaryHeaderColor,
          activeColorSecondary: theme.primaryColor,
          inactiveColorPrimary: Colors.black,
          inactiveIcon: SvgPicture.asset(
            ImageConstant.imgCamera,
            height: 30,
            width: 30,
          )),
      if(_controller.appoinmentNotification.value==true)

      PersistentBottomNavBarItem(



        icon: SvgPicture.asset(ImageConstant.imgAppoinment,
            height: 30, width: 30, color: theme.primaryColor),
        title: ("Appoinment"),
        textStyle: TextStyle(),
        activeColorPrimary: theme.secondaryHeaderColor,
        activeColorSecondary: theme.primaryColor,
        inactiveColorPrimary: Colors.black,
        inactiveIcon: SvgPicture.asset(
          ImageConstant.imgAppoinment,
          height: 30,
          width: 30,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Scaffold(


            body:  Obx(() {
              return PersistentTabView(


                context,
                controller:tabController ,


                screens: _pages(),
                onWillPop: (context) async {
                  await showDialog(
                    context: context!,
                    useSafeArea: true,
                    builder: (context) => Container(
                      height: 50.0,
                      width: 50.0,
                      color: Colors.white,
                      child: ElevatedButton(
                        child: Text("Close"),
                        onPressed: () {
                          print("button pressed");
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                  return false;
                },
                onItemSelected:(value) => _controller.onItemTapped(value),
                hideNavigationBar: _controller.showNavigationBar.value,
                stateManagement: true,




                items: _navBarsItems(),
                confineInSafeArea: true,
                padding: NavBarPadding.only(right: 10),
                backgroundColor: Colors.white,
                handleAndroidBackButtonPress: true,
                resizeToAvoidBottomInset: true,
                hideNavigationBarWhenKeyboardShows: true,
                decoration: NavBarDecoration(

                  colorBehindNavBar: Colors.indigo,
                ),
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: ItemAnimationProperties(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOutCubic,
                ),
                screenTransitionAnimation: ScreenTransitionAnimation(
                  animateTabTransition: true,
                  curve: Curves.bounceInOut,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle.style7,
              );
            }),

              //     IndexedStack(
              //   index: _controller.currentIndex.value,
              //   children: _pages,
              // ),

            drawer: Drawer(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
                child: ListView(
                  children: [
                    Container(
                        height: 70.v,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(bottom: 10.h),
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 0.h, top: 17.v, bottom: 10.v),
                            child: Image(
                              image: AssetImage(
                                ImageConstant.imgImage2,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // AppbarTitleImage(
                          //     imagePath: ImageConstant.imgSantaHat1,
                          //     margin:
                          //         EdgeInsets.only(right: 182.h, bottom: 33.v))
                        ])),
                    Container(
                        decoration: AppDecoration.outlineBlack900.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10),
                        child: Row(children: [
                          // Container(
                          //     height: 100.adaptSize,
                          //     width: 100.adaptSize,
                          //     padding: EdgeInsets.symmetric(
                          //         horizontal: 9.h, vertical: 10.v),
                          //     decoration: AppDecoration.fillPrimary,
                          //     child: CustomImageView(
                          //         imagePath: ImageConstant.imgEllipse1,
                          //         height: 80.adaptSize,
                          //         width: 80.adaptSize,
                          //         radius: BorderRadius.circular(40.h),
                          //         alignment: Alignment.center)),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 15.h, top: 15.v, bottom: 15.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() =>
                                    Text(name.value,
                                        style:
                                            CustomTextStyles.titleMediumBold)),
                                    SizedBox(height: 5.v),
                                    Obx(() =>
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "lbl_case_id2".tr,
                                              style:
                                                  theme.textTheme.labelLarge),
                                          TextSpan(
                                              text: " "+caseId.value,
                                              style: theme.textTheme.bodySmall)
                                        ]),
                                        textAlign: TextAlign.left)),
                                    SizedBox(height: 4.v),
                                    GestureDetector(
                                        onTap: () {
                                          if(getDashboardData!=null){



                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return StatusScreen(getDashboardData: getDashboardData,);
                                          },));}else{
                                            print("data is bot");
                                          }
                                        },
                                        child: Row(children: [
                                          RichText(
                                              text: TextSpan(children: [
                                                TextSpan(
                                                    text: "lbl_status".tr,
                                                    style: theme
                                                        .textTheme.labelLarge),
                                                TextSpan(
                                                    text: "lbl_more_info".tr,
                                                    style: CustomTextStyles
                                                        .labelLargePrimary_1)
                                              ]),
                                              textAlign: TextAlign.left),
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgEpInfoFilled,
                                              height: 10.adaptSize,
                                              width: 10.adaptSize,
                                              margin: EdgeInsets.only(
                                                  left: 5.h,
                                                  top: 4.v,
                                                  bottom: 3.v))
                                        ]))
                                  ]))
                        ])),
                    SizedBox(height: 30.v),
                    _buildFrameRow(
                        userImage: ImageConstant.imgSettingsBlack900,
                        appSettingsText: "lbl_tax_news".tr,
                        onTapFrameRow: () {
                          _controller.onTaxNews();
                        }),
                    SizedBox(height: 15.v),
                    _buildFrameRow(
                        userImage: ImageConstant.imgGroup18,
                        appSettingsText: "lbl_app_settings".tr,
                        onTapFrameRow: () {
                          _controller.onAppSetting();
                        }),
                    SizedBox(height: 15.v),
                    _buildFrameRow(
                        userImage: ImageConstant.imgProfile,
                        appSettingsText: "lbl_faq".tr,
                        onTapFrameRow: () {
                          _controller.onFQQ();
                        }),
                    SizedBox(height: 15.v),
                    _buildFrameRow(
                        userImage: ImageConstant.imgGroup18Black900,
                        appSettingsText: "lbl_get_in_touch".tr,
                        onTapFrameRow: () {
                          _controller.onGetInTouch();
                        }),
                    SizedBox(height: 15.v),
                    Obx(() {
                      return _controller.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : _buildFrameRow(
                              userImage: ImageConstant.imgArrowdown,
                              appSettingsText: "lbl_sign_out".tr,
                              onTapFrameRow: () {
                                _controller.onLogout();
                              });
                    })
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildFrameRow({
    required String userImage,
    required String appSettingsText,
    Function? onTapFrameRow,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFrameRow?.call();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
            decoration: AppDecoration.outlineBlack900
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomImageView(
                  imagePath: userImage,
                  height: 30.adaptSize,
                  width: 30.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 15.h, top: 5.v),
                  child: Text(appSettingsText,
                      style: theme.textTheme.titleMedium!
                          .copyWith(color: appTheme.black900))),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowRightBlack900,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 5.v))
            ])));
  }
}
