import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/gestures.dart';
import '../../widgets/comman_widget.dart';
import '../dashboard_page/controller/dashboard_controller.dart';
import 'models/faq_model.dart';
import 'controller/faq_controller.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_title_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:preeti_s_application3/widgets/custom_bottom_bar.dart';

class FaqScreen extends GetWidget<FaqController> {
  FaqScreen({Key? key}) : super(key: key);
  static const headerStyle = TextStyle(
      color: Color(0xff000000), fontSize: 13.5, fontWeight: FontWeight.w500);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 12, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff000000), fontSize: 12, fontWeight: FontWeight.normal);

  FaqModel faqModel = FaqModel();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
        appBar: CustomAppBar(
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
                  child: CircularProgressIndicator(),
                )
              : Container(
            padding: EdgeInsets.only(left: 30,right: 30),
                child: Column(
                    children: [

                      CW.buildDashboardRow(text: "msg_answers_to_your".tr),
                      SizedBox(height: 15.v,),
                      CW.statusCard(
                          text: "msg_faq_screen".tr, height: 57.v),
                      TabBar.secondary(
                        padding: EdgeInsets.only(
                            left: 10.h, right: 10.h, bottom: 25.v),
                        controller: controller.tabController,
                        labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                        tabs: <Widget>[
                          Tab(text: "msg_processing_faq".tr,),
                          Tab(text: 'msg_service_faq'.tr),

                        ],

                      ),
                      if(controller.faq_modal.value!=null)
                      SizedBox(
                        //   height:controller.faq_modal.value!.data!.processingFaqs!.length*100,
                        height: mediaQueryData.size.height * 0.4,
                        child: TabBarView(
                          controller: controller.tabController,
                          physics: NeverScrollableScrollPhysics(),


                          children: <Widget>[

                            ScrollConfiguration(
                              behavior: ListScrollBehaviour(

                              ),
                              child: Scrollbar(
                                thumbVisibility: true,
                                radius: Radius
                                    .circular(5), // Adjust the radius of the scrollbar thumb


                                controller: controller.scrollController1,
                                thickness: 5, // Adjust the thickness of the scrollbar
                                showTrackOnHover: true, // Show scrollbar track on hover


                                interactive: true, // Allow scrollbar interaction




                                  child: ListView.separated(

                                    controller: controller.scrollController1,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                        height: 10,
                                      );
                                    },
                                    padding: EdgeInsets.only(
                                        left: 5, right: 20, top: 5, bottom: 5),
                                    itemBuilder: (context, index) {
                                      print(controller.faq_modal.value!.data!
                                          .processingFaqs!.length);

                                      return FaqModel.Acordian(

                                          headerStyle,
                                          "msg_content_text".tr,
                                          contentStyle,
                                          controller.processingFaqsData
                                              .elementAt(index)
                                              .question,
                                          controller.processingFaqsData
                                              .elementAt(index)
                                              .answer,
                                          5.0);
                                    },
                                    itemCount: controller
                                        .faq_modal.value!.data!.processingFaqs!.length,
                                  ),

                              ),
                            ),
                            ScrollConfiguration(
                              behavior: ListScrollBehaviour(

                              ),
                              child: Scrollbar(
                                thumbVisibility: true,
                                radius: Radius
                                    .circular(5), // Adjust the radius of the scrollbar thumb


                                controller: controller.scrollController2,
                                thickness: 5, // Adjust the thickness of the scrollbar
                                showTrackOnHover: true, // Show scrollbar track on hover


                                interactive: true,
                                child: ListView.separated(
                                  controller: controller.scrollController2,
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      height: 10,
                                    );
                                  },
                                  padding: EdgeInsets.only(
                                      left: 5, right: 20, top: 5, bottom: 5),
                                  itemBuilder: (context, index) {
                                    return FaqModel.Acordian(
                                        headerStyle,
                                        "msg_content_text".tr,
                                        contentStyle,
                                        controller.serviceFaqs
                                            .elementAt(index)
                                            .question,
                                        controller.serviceFaqs
                                            .elementAt(index)
                                            .answer,
                                        5.0);
                                  },
                                  itemCount: controller
                                      .faq_modal.value!.data!.serviceFaqs!.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.v,),
                      CW.termCondition(satOfficerEmail.value),
                      SizedBox(height: 50.v,),
                    ],
                  ),
              );
        }));
  }



  /// Navigates to the settingsScreen when the action is triggered.
  onTapImage() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
}
