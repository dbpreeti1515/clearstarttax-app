import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

import 'appbar_leading_image.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 75.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      flexibleSpace: _getStyle(),

      leadingWidth: leadingWidth ??  mediaQueryData.size.width*0.19,
      leading: leading
          ,
      title: title?? Container(
          height: 70.v,
          margin: EdgeInsets.only(left: 0.h, top: 10.v, bottom: 10.v),
          child: Stack(alignment: Alignment.topLeft, children: [
            Container(
              margin: EdgeInsets.only(left:mediaQueryData.size.width*0.093, top: 17.v, bottom: 10.v),
              child: Image(
                image: AssetImage(
                  ImageConstant.imgImage2,
                ),
              ),
            ),

          ])),
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQueryData.size.width,
        height ?? 75.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgShadow:
        return Container(
          height: 75.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimaryContainer,
            boxShadow: [
              BoxShadow(
                color: appTheme.black900.withOpacity(0.1),
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: Offset(
                  0,
                  2,
                ),
              ),
            ],
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgShadow,
}
