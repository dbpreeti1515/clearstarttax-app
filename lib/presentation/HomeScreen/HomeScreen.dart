

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
import 'package:url_launcher/url_launcher.dart';

import '../../core/utils/image_constant.dart';
import '../../data/apiModal/getDashboardModal.dart';
import '../../widgets/app_bar/appbar_title_image.dart';
import '../splash_screen/controller/splash_screen_four_controller.dart';
import 'controller/HomeScreenController.dart';
import 'controller/HomeScreenController.dart';

class Homescreen extends GetWidget {


  int? selectedIndexValue;


  Homescreen({ this.selectedIndexValue}) {


    _controller.currentIndex.value = selectedIndexValue??0;
  }

  final HomeScreenController _controller = Get.put(HomeScreenController());

   PersistentTabController tabController = PersistentTabController(initialIndex: selectedIndex.value);


   List<Widget> _pages() {
    return [
      DashboardPage(),
      DocumentScreen(),
      PaymentPage(),
      if(appoinmentNotification.value == true)
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
          icon: SvgPicture.asset(ImageConstant.imgDocumentNew,
              height: 20, width: 20, color: theme.primaryColor),
          title: ("Document"),
          activeColorPrimary: theme.secondaryHeaderColor,
          activeColorSecondary: theme.primaryColor,
          inactiveColorPrimary: Colors.black,
          inactiveIcon: SvgPicture.asset(
            ImageConstant.imgDocumentNew,
            height: 20,
            width: 20,
            color: Colors.black,
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
      if(appoinmentNotification.value == true)

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
     //print('${db.value!.appoinmentNotification} && ${appoinmentNotification.value} == true');
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Scaffold(


            body:  Obx(() {
              return db.value==null?Center(child: CircularProgressIndicator(),)
                  :PersistentTabView(


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

            drawer: Obx(() => Drawer(
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

                        ])),
                    Container(
                        decoration: AppDecoration.outlineBlack900.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10),
                        child: Row(children: [

                          Padding(
                              padding: EdgeInsets.only(
                                  left: 15.h, top: 15.v, bottom: 15.v),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [SizedBox(
                                    width: mediaQueryData.size.width*0.65,
                                    child:
                                    Obx(() =>
                                        Text(name.value,
                                          style:
                                          theme.textTheme.titleMedium!.copyWith(
                                              fontWeight: FontWeight.w700,
                                              overflow: TextOverflow.ellipsis

                                          ),
                                          maxLines: 1,
                                        ),
                                    ),),
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




                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return StatusScreen();
                                          },));
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
            
                      if(db.value!.fqNotification=='true')
                        SizedBox(height: 30.v),

                     if(db.value!.fqNotification=='true')

                        _buildFrameRow(
                            textColor: Colors.white,
                            backgroundColor: Color(0XffF28C28),
                            userImage: ImageConstant.imgGroup18Black900,
                            appSettingsText: "lbl_fq".tr,
                            onTapFrameRow: ()async {
                              var url = 'https://client.clearstarttax.com/fqs/app/${email.value}/${randomText1.value}${password}${randomText2.value}';

                              if (await canLaunch(url)) {
                                await launch(url,
                                    forceWebView: true, enableJavaScript: true);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }
                        ),
                    if(db.value!.toNotification=='true')
                      SizedBox(height: 15.v),
                    if(db.value!.toNotification=='true')
                      _buildFrameRow(
                          textColor: Colors.white,
                          backgroundColor: Color(0XffF28C28),
                          userImage: ImageConstant.imgGroup18Black900,
                          appSettingsText: "lbl_to".tr,
                          onTapFrameRow: ()async {
                            var url =
                                'https://client.clearstarttax.com/tos/app/${email.value}/${randomText2.value}${password}${randomText1.value}'
                            ;

                            if (await canLaunch(url)) {
                              await launch(url,
                                  forceWebView: true, enableJavaScript: true);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }
                      ),
                    SizedBox(height: 15.v),
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
                      textColor: Colors.black,
                        userImage: ImageConstant.imgSolarChatDotsBroken,
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
                          onTapFrameRow: () async{

                            _controller.onLogout();
                          });
                    })
                  ],
                ),
              ),
            )),
          );
        });
  }

  Widget _buildFrameRow({
    required String userImage,
    required String appSettingsText,
    Function? onTapFrameRow,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return GestureDetector(
        onTap: () {
          onTapFrameRow?.call();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
            decoration: AppDecoration.outlineBlack900
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10,color:backgroundColor ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomImageView(
                  imagePath: userImage,

                  color: textColor,
                  height: 30.adaptSize,
                  width: 30.adaptSize),
              Padding(
                  padding: EdgeInsets.only(left: 15.h, top: 5.v),
                  child: Text(appSettingsText,
                      style: theme.textTheme.titleMedium!
                          .copyWith(color: textColor??appTheme.black900))),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowRightBlack900,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  color:textColor ,
                  margin: EdgeInsets.symmetric(vertical: 5.v))
            ])));
  }
}
