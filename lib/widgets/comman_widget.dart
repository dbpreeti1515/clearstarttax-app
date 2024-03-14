import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:preeti_s_application3/core/app_export.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/local_database/database_helper/database_helper.dart';
import '../presentation/dashboard_page/controller/dashboard_controller.dart';

class CW {

  static void _launchEmail() async {
    const String email = 'mailto:billing@clearstarttax.com';
    if (await canLaunch(email)) {
      await launch(email);
    } else {
      throw 'Could not launch $email';
    }
  }

  static void _launchPhone() async {
    const String phone = 'tel:+18882350004';
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Could not launch $phone';
    }
  }

  static Widget commonTextFieldForLoginSignUP({
    BuildContext? context,
    double? elevation,
    String? hintText,
    EdgeInsetsGeometry? contentPadding,
    TextEditingController? controller,
    int? maxLines,
    double? cursorHeight,
    Widget? prefixIcon,
    bool wantBorder = true,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    Color? fillColor,
    Color? initialBorderColor,
    double? initialBorderWidth,
    TextInputType? keyboardType,
    double? borderRadius,
    double? maxHeight,
    TextStyle? hintStyle,
    TextStyle? style,
    GestureTapCallback? onTap,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization textCapitalization = TextCapitalization.none,
    bool autofocus = false,
    bool readOnly = false,
  }) {
    return Container(

      height: maxHeight,
      child: TextFormField(
        onTapOutside: (event) {
          FocusScope.of(context!).unfocus();
        },
        cursorHeight: cursorHeight,
        onTap: onTap,
        controller: controller,
        onChanged: onChanged ??
            (value) {
              value = value.trim();
              if (value.isEmpty || value.replaceAll(" ", "").isEmpty) {
                controller?.text = "";
              }
            },
        validator: validator,
        keyboardType: keyboardType ?? TextInputType.streetAddress,
        readOnly: readOnly,
        autofocus: autofocus,
        inputFormatters: inputFormatters,
        textCapitalization: textCapitalization,
        style: style ??
            Theme.of(Get.context!)
                .textTheme
                .bodyMedium
                ?.copyWith(fontFamily: 'Poppins', color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: fillColor ?? Colors.white,
          filled: true,
          prefixIcon: prefixIcon,
          errorStyle: TextStyle(fontSize: 12,color:ColorSchemes.primaryColorScheme.error),
          contentPadding:
              contentPadding ?? EdgeInsets.symmetric(horizontal: 20.h),
          hintStyle: hintStyle ??
              Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
                  fontFamily: 'Poppins',
                  color: Colors.grey.shade600,
                  fontSize: 12),
          disabledBorder: OutlineInputBorder(
              borderSide: wantBorder
                  ? BorderSide(color: appTheme.blueGray100, width: 1.h)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? 5)),
          border: OutlineInputBorder(
              borderSide: wantBorder
                  ? BorderSide(color: Colors.blue, width: 1.h)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? 5)),
          enabledBorder: OutlineInputBorder(
              borderSide: wantBorder
                  ? BorderSide(
                      color: initialBorderColor ?? appTheme.blueGray100,
                      width: initialBorderWidth ?? 1.h)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? 5)),
          errorBorder: OutlineInputBorder(
              gapPadding: 10,
              borderSide: wantBorder
                  ? BorderSide(color: Colors.red, width: 1.h)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius ?? 5)),
        ),
      ),
    );
  }

  static Widget buildDashboardRow({String? text}) {
    return Padding(
        padding: EdgeInsets.only(left: 4.h, right: 5.h, top: 15, bottom: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(greatinMsg.value+ ' '+ name.value.toString() ?? '',
              style: CustomTextStyles.titleMediumSourceSerif4OnError),
          SizedBox(height: 4.v),
          SizedBox(
              width: double.maxFinite,
              child: Text(text ?? '',
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumPrimary)),
        ]));
  }

  static Widget buildContact({String? text}) {
    return Padding(
        padding: EdgeInsets.only(left: 4.h, right: 5.h, top: 0, bottom: 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("msg_if_you_have_questions".tr,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyMedium),
          SizedBox(height: 9.v),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.phone_in_talk_outlined,
              color: Colors.white,
              size: 15,
            ),
            // CustomImageView(
            //     imagePath: ImageConstant.imgCall,
            //
            //     height: 12.adaptSize,
            //     width: 12.adaptSize),
            Padding(
                padding: EdgeInsets.only(left: 5.h, right: 15.h),
                child: Text("lbl_888_235_0004".tr,
                    style: CustomTextStyles.bodySmall8)),
            Icon(
              Icons.email_outlined,
              color: Colors.white,
              size: 15,
            ),

            // CustomImageView(
            //     imagePath: ImageConstant.imgSystemUiconsMail,
            //     height: 12.adaptSize,
            //     width: 12.adaptSize,
            //     margin: EdgeInsets.only(left: 10.h)),
            Padding(
                padding: EdgeInsets.only(left: 5.h),
                child: Text("msg_info_clearstarttax_com".tr,
                    style: CustomTextStyles.bodySmall8))
          ])
        ]));
  }

  static Widget statusCard({String? text, required double height}) {
    return Container(
      height: height,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      decoration: AppDecoration.outlinePrimary,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.v),
            Text(
              text ?? '',
              style: CustomTextStyles.titleMediumOnPrimaryContainer18,
              textAlign: TextAlign.center,
            )
          ]),
    );
  }

  static Widget termCondition(String email,{Color? textColor, double? fontSize}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

          Text("msg_if_you_have_questions".tr,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  color: textColor??Colors.black
              )),
          SizedBox(height: 10.v,),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomImageView(
                imagePath: ImageConstant.imgSolarPhoneCallingBroken,
                color: textColor??Colors.black,
                height: 16.adaptSize,
                width: 16.adaptSize),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 5, top: 0),
                minimumSize: Size(30, 20),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                _launchPhone();
              },
              child: Text("lbl_888_235_0004".tr,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.primary,
                    fontSize: 12

                  )),
            ),
            CustomImageView(
                imagePath: ImageConstant.imgSystemUiconsMailPrimarycontainer,
                height: 16.adaptSize,
                width: 16.adaptSize,
                color: textColor??Colors.black,
                margin: EdgeInsets.only(left: 10.h)),
            TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: 5, top: 0),
                  minimumSize: Size(30, 20),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft,
                ),
                onPressed: () {
                  _launchEmail();
                },
                child: Text(email,
                    style: CustomTextStyles.bodyLargePrimary))
          ]),
        ],
      ),
    );
  }
}

class ListScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
