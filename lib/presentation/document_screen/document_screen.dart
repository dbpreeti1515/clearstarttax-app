import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/Comman/common_method.dart';
import '../../widgets/comman_widget.dart';
import '../dashboard_page/controller/dashboard_controller.dart';
import 'controller/document_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/appbar_title_image.dart';
import 'package:preeti_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:preeti_s_application3/widgets/custom_bottom_bar.dart';
import 'package:preeti_s_application3/widgets/custom_outlined_button.dart';

class DocumentScreen extends GetWidget<DocumentController> {
  DocumentScreen({Key? key}) : super(key: key);
  final DocumentController _controller = Get.put(DocumentController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: CustomAppBar(
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
        return SizedBox(
            width: double.maxFinite,
            child: Column(children: [
              SizedBox(height: 19.v),
              Expanded(
                  child: SingleChildScrollView(
                child: _buildDocument(context),
              )),
            ]));
      }),
    );
  }

  /// Section Widget
  Widget _buildDocumentColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {

                  await _controller.pickPDF();


              },
              child: DottedBorder(
                  color: theme.colorScheme.primaryContainer,
                  padding: EdgeInsets.only(
                      left: 1.h, top: 1.v, right: 1.h, bottom: 1.v),
                  strokeWidth: 1.h,
                  radius: Radius.circular(5),
                  borderType: BorderType.RRect,
                  dashPattern: [2.5, 2],
                  child: Container(
                      height: 145.v,
                      width: mediaQueryData.size.width * 0.8,
                      padding:
                          EdgeInsets.only(left: 10, bottom: 10, right: 10),
                      decoration: AppDecoration.outlinePrimaryContainer
                          .copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder5),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                                   CustomImageView(
                                      imagePath: ImageConstant
                                          .imgArrowRightPrimarycontainer,
                                      height: 30.adaptSize,
                                      width: 30.adaptSize),


                            SizedBox(height: 12.v),
                            Obx(() {
                              print("this is value ${controller.selectedFiles.value}");
                              return
                                   Center(
                                      child: Text(
                                          "msg_drag_or_upload_your".tr,
                                          style: CustomTextStyles
                                              .bodySmallRobotoPrimaryContainer),
                                    );

                            })
                          ]))),
            ),
            SizedBox(height: 11.v),
            Align(
                alignment: Alignment.centerRight,
                child: Text("msg_maximum_document".tr,
                    style: theme.textTheme.bodySmall!
                        .copyWith(fontSize: 11, color: Colors.black))),
            SizedBox(height: 20.v),
    if (_controller.selectedFiles.value.isNotEmpty)

            SizedBox(
              height:
              mediaQueryData.size.height * 0.15,
              child:Obx(() =>  ScrollConfiguration(
                behavior: ListScrollBehaviour(

                ),

                child: Scrollbar(
                  radius: Radius
                      .circular(5),

                  thumbVisibility: true,
                  controller:
                 controller.scrollController,
                  scrollbarOrientation:   ScrollbarOrientation.right,
                  thickness: 5,






                  child: ListView.separated(
                      physics:
                      const AlwaysScrollableScrollPhysics(),
                     padding: EdgeInsets.only(left: 10.h, right: 20.h),
                      shrinkWrap: true,
                    controller: controller.scrollController,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Obx(() => Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(
                                    4),
                                border: Border.all(
                                    color: Colors.black,
                                    width: 1)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  SizedBox(
                                    width: mediaQueryData
                                        .size.width *
                                        0.6,
                                    child: Text(
                                      controller
                                          .selectedFiles
                                          .value[index]
                                          .path
                                          .split('/')
                                          .last,
                                      overflow:
                                      TextOverflow
                                          .ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _controller
                                          .selectedFiles
                                          .removeAt(
                                          index);
                                    },
                                    style: IconButton.styleFrom(
                                        minimumSize:
                                        Size(30, 20),
                                        tapTargetSize:
                                        MaterialTapTargetSize
                                            .shrinkWrap,
                                        padding:
                                        EdgeInsets
                                            .zero),
                                    icon:
                                    SvgPicture.asset(
                                      ImageConstant
                                          .imgDashboardCross,
                                      color: Colors.red,
                                      height: 15,
                                      width: 15,
                                    ),
                                  )
                                ],
                              ),
                            )));
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 8);
                      },
                      itemCount: _controller
                          .selectedFiles.value.length),
                ),
              )),
            ),

            Obx(() {
              return _controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomOutlinedButton(
                margin: EdgeInsets.only(top: 20.v),

                      width: 216.h,
                      text: "lbl_upload_pdf".tr,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onPressed: () async {
                        if (_controller.selectedFiles.value.isNotEmpty) {

                          await _controller.uploadPDF(context);
                        } else {
                          CM.showToast("Please select document");
                        }
                      },
                    );
            })
          ],
        ));
  }

  /// Section Widget
  Widget _buildDocument(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 5.v),
        child: Column(children: [
          CW.buildDashboardRow(text: "err_msg_submit".tr),
          SizedBox(height: 10.v),
          Container(
              decoration: AppDecoration.outlineBlack
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                CW.statusCard(text: "lbl_upload_document".tr, height: 57.v),
                SizedBox(height: 20.v),
                _buildDocumentColumn(context),
                SizedBox(
                  height: 20.v,
                ),
                Obx(
                  () => CW.termCondition(satOfficerEmail.value),
                ),
                SizedBox(
                  height: 20.v,
                ),
              ]))
        ]));
  }

  /// Navigates to the settingsScreen when the action is triggered.
  onTapImage() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
}
