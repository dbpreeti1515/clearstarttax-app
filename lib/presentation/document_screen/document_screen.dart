import 'dart:ffi';
import 'dart:io';

import 'package:file_picker/file_picker.dart';

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
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: AppbarLeadingImage(
              imagePath: ImageConstant.imgSolarHamburgerMenuBroken,
              margin: EdgeInsets.only(
                left: 0.h,
              ),
              onTap: () {
                Scaffold.of(context).openDrawer();
                //onTapImage();
              }),
          onPressed: () {
            // Scaffold.of(context).openDrawer();
          },
        ),
        leadingWidth: 80,
        title: Container(
            height: 70.v,
            margin: EdgeInsets.only(left: 0.h, top: 10.v, bottom: 10.v),
            child: Stack(alignment: Alignment.topLeft, children: [
              Container(
                margin: EdgeInsets.only(left: 22.h, top: 17.v, bottom: 10.v),
                child: Image(
                  image: AssetImage(
                    ImageConstant.imgImage2,
                  ),
                ),
              ),
              // AppbarTitleImage(
              //     imagePath: ImageConstant.imgSantaHat1,
              //     margin: EdgeInsets.only(right: 204.h, bottom: 33.v))
            ])),
      ),
      body: SizedBox(
          width: double.maxFinite,
          child: Column(children: [
            SizedBox(height: 19.v),
            Expanded(
                child: SingleChildScrollView(child: _buildDocument(context),
                )),

          ])),
    ));
  }

  /// Section Widget
  Widget _buildDocumentColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: GestureDetector(
          onTap: () async{
            _controller.pdfFile = await _controller.pickPDF();
            if (_controller.pdfFile != null) {
              _controller.FilePath.value = _controller.pdfFile!.path;
            }
          },
          child: Column(children: [
            DottedBorder(
                color: theme.colorScheme.primaryContainer,
                padding:
                    EdgeInsets.only(left: 1.h, top: 1.v, right: 1.h, bottom: 1.v),
                strokeWidth: 1.h,
                radius: Radius.circular(5),
                borderType: BorderType.RRect,
                dashPattern: [10, 10],
                child: Container(
                  height: 135.v,
                    width: mediaQueryData.size.width*0.8,

                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
                    decoration: AppDecoration.outlinePrimaryContainer
                        .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Column(mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                            Obx(() {
                              return _controller.FilePath.value==''?

                      CustomImageView(
                          imagePath:
                              ImageConstant.imgArrowRightPrimarycontainer,
                          height: 30.adaptSize,
                          width: 30.adaptSize):SizedBox(); }),
                      SizedBox(height: 12.v),
                      Obx(() =>

                      Center(
                        child: Text(_controller.FilePath.value!=''?_controller.FilePath.value:"msg_drag_or_upload_your".tr,
                            style:
                                CustomTextStyles.bodySmallRobotoPrimaryContainer),
                      ))
                    ]))),
            SizedBox(height: 11.v),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("msg_maximum_document".tr,
                    style: CustomTextStyles.bodySmallPrimary_1)),
            SizedBox(height: 19.v),
            Obx(() {
              return _controller.isLoading.value?Center(child: CircularProgressIndicator(),):

            CustomOutlinedButton(
              width: 216.h,
              text: "lbl_upload_pdf".tr,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () async {

                if (_controller.pdfFile != null) {
                  await _controller.uploadPDF(_controller.pdfFile!,context);
                }else{
                  CM.showToast("Please select document");
                }


              },);
             })
          ]),
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

                CW.statusCard(text: "lbl_upload_document".tr,height: 57.v),
                SizedBox(height: 20.v),
                _buildDocumentColumn(context),

                SizedBox(height: 25.v,),
                Obx(() =>
                CW.termCondition(satOfficerEmail.value),),
                SizedBox(height: 20.v,),
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
