import 'package:flutter_svg/svg.dart';
import 'package:preeti_s_application3/presentation/document_screen/document_screen.dart';
import 'package:preeti_s_application3/presentation/payment_page/payment_page.dart';

import '../../widgets/app_bar/appbar_title_image.dart';
import '../../widgets/custom_text_form_field.dart';

import 'controller/dashboard_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/presentation/dashboard_page/dashboard_page.dart';
import 'package:preeti_s_application3/widgets/custom_bottom_bar.dart';

class DashboardContainerScreen extends GetWidget<DashboardContainerController> {
  const DashboardContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        body: Obx(() {
          // Observe the selected index and display the corresponding page
          switch (controller.selectedIndex.value) {
            case 0:
              return DashboardPage();
            case 1:
              return DocumentScreen();
            case 2:
              return PaymentPage();

            default:
              return Container(); // Handle the default case as needed
          }},



        // Navigator(
        //     key: Get.nestedKey(1),
        //     initialRoute: AppRoutes.dashboardPage,
        //     onGenerateRoute: (routeSetting) => GetPageRoute(
        //         page: () => getCurrentPage(routeSetting.name!),
        //         transition: Transition.noTransition)),
        //bottomNavigationBar: _buildBottomBar()
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          selectedItemColor: Colors.blue,

          type: BottomNavigationBarType.fixed,
          onTap: controller.changePage,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImageConstant.imgDashboard, height: 24, width: 24),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(

              icon: SvgPicture.asset(ImageConstant.imgDocument, height: 24, width: 24),
              label: 'Document',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImageConstant.imgCamera, height: 24, width: 24),
              label: 'Payment',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImageConstant.imgAppoinment, height: 24, width: 24),
              label: 'Appoinment',
            ),
          ],
        ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,


        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.h,vertical: 12.v),
          child: ListView(
            children: [
              Container(
                  height: 70.v,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(bottom: 10.h),


                  child: Stack(alignment: Alignment.center, children: [
                    Container( margin: EdgeInsets.only(left: 0.h, top: 17.v,bottom: 10.v),
                      child: Image(image: AssetImage(ImageConstant.imgImage2,
                      ),
                      fit: BoxFit.cover,

                      ),
                    ),

                    AppbarTitleImage(
                        imagePath: ImageConstant.imgSantaHat1,
                        margin: EdgeInsets.only(right: 182.h, bottom: 33.v))
                  ])),
              Container(
                  decoration: AppDecoration.outlineBlack900
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: Row(children: [
                    Container(
                        height: 100.adaptSize,
                        width: 100.adaptSize,
                        padding:
                        EdgeInsets.symmetric(horizontal: 9.h, vertical: 10.v),
                        decoration: AppDecoration.fillPrimary,
                        child: CustomImageView(
                            imagePath: ImageConstant.imgEllipse1,
                            height: 80.adaptSize,
                            width: 80.adaptSize,
                            radius: BorderRadius.circular(40.h),
                            alignment: Alignment.center)),
                    Padding(
                        padding:
                        EdgeInsets.only(left: 15.h, top: 15.v, bottom: 15.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_christian_ha".tr,
                                  style: CustomTextStyles.titleMediumBold),
                              SizedBox(height: 5.v),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "lbl_case_id2".tr,
                                        style: theme.textTheme.labelLarge),
                                    TextSpan(
                                        text: "lbl_857881".tr,
                                        style: theme.textTheme.bodySmall)
                                  ]),
                                  textAlign: TextAlign.left),
                              SizedBox(height: 4.v),
                              GestureDetector(
                                  onTap: () {

                                  //  onTapFrameThirtySeven();
                                  },
                                  child: Row(children: [
                                    RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: "lbl_status".tr,
                                              style: theme.textTheme.labelLarge),
                                          TextSpan(
                                              text: "lbl_more_info".tr,
                                              style: CustomTextStyles
                                                  .labelLargePrimary_1)
                                        ]),
                                        textAlign: TextAlign.left),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgEpInfoFilled,
                                        height: 10.adaptSize,
                                        width: 10.adaptSize,
                                        margin: EdgeInsets.only(
                                            left: 5.h, top: 4.v, bottom: 3.v))
                                  ]))
                            ]))
                  ])),
              SizedBox(height: 30.v),
              _buildFrameRow(
                  userImage: ImageConstant.imgSettingsBlack900,
                  appSettingsText: "lbl_tax_news".tr,
                  onTapFrameRow: () {
                    controller.onTaxNews();

                  }),
              SizedBox(height: 15.v),
              _buildFrameRow(
                  userImage: ImageConstant.imgGroup18,
                  appSettingsText: "lbl_app_settings".tr,
                  onTapFrameRow: () {
                controller.onAppSetting();
                  }),
              SizedBox(height: 15.v),
              _buildFrameRow(
                  userImage: ImageConstant.imgProfile,
                  appSettingsText: "lbl_faq".tr,
                  onTapFrameRow: () {
             controller.onFQQ();
                  }),
              SizedBox(height: 15.v),
              _buildFrameRow(
                  userImage: ImageConstant.imgGroup18Black900,
                  appSettingsText: "lbl_get_in_touch".tr,
                  onTapFrameRow: () {
               controller.onGetInTouch();
                  }),
              SizedBox(height: 15.v),
              _buildFrameRow(
                  userImage: ImageConstant.imgArrowdown,
                  appSettingsText: "lbl_sign_out".tr,
                  onTapFrameRow: () {
                    controller.onLogout();
                  }),

           
            ],
          ),
        ),

      ),
      );
  }

//   /// Section Widget
//   Widget _buildBottomBar() {
//     return CustomBottomBar(onChanged: (BottomBarEnum type) {
//       print(type);
//     });
//   }
//
//   ///Handling page based on route
//   Widget getCurrentPage(String currentRoute) {
//     print("page route $currentRoute");
//     switch (currentRoute) {
//       case AppRoutes.dashboardPage:
//       return DashboardPage();
//       case AppRoutes.documentScreen:
//       return DocumentScreen();
//       case AppRoutes.dashboardPage:
//       return DashboardPage();
//       case AppRoutes.paymentPage:
//       return PaymentPage();
//       default:
//         return DashboardPage();
//     }
//
//   }
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
                          .copyWith(color: appTheme.black900)
                  )
              ),
              Spacer(),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowRightBlack900,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 5.v))
            ])));
  }
}
