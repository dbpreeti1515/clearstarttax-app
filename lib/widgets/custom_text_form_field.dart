import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preeti_s_application3/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.onChange,
    this.filled = true,
    this.validator, this.inputFormatter,  this.enable,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final bool? obscureText;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;
  ValueChanged<String>?onChange;

  final String? hintText;
  final List<TextInputFormatter>? inputFormatter;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;
  final bool? enable;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context),
          )
        : textFormFieldWidget(context);
  }

  Widget  textFormFieldWidget(BuildContext context) {
    return  SizedBox(
      width: width ?? double.maxFinite,
      child: TextFormField(
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },

        onChanged: onChange,



        enabled: enable,
        inputFormatters: inputFormatter,
        controller: controller,
        focusNode: focusNode ?? FocusNode(),
        autofocus: autofocus!,
        style: textStyle ?? theme.textTheme.bodyMedium,
        obscureText: obscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: decoration,
        validator: validator,
      ),
    );
  }


  InputDecoration get decoration => InputDecoration(
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? CustomTextStyles.headlineSmallGray600,
        prefixIcon: prefix,
        prefixIconConstraints: prefixConstraints,
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,

        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 12.v,
            ),
        fillColor: fillColor ?? theme.colorScheme.onPrimaryContainer,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.h),
              borderSide: BorderSide(
                color: appTheme.blueGray100,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.h),
              borderSide: BorderSide(
                color: appTheme.blueGray100,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.h),
              borderSide: BorderSide(
                color: appTheme.gray600,
                width: 1,
              ),
            ),
      );
}

/// Extension on [CustomTextFormField] to facilitate inclusion of all types of border style etc
extension TextFormFieldStyleHelper on CustomTextFormField {
  static UnderlineInputBorder get underLineSecondaryContainer =>
      UnderlineInputBorder(
        borderSide: BorderSide(
          color: theme.colorScheme.secondaryContainer,
        ),
      );
  static OutlineInputBorder get outlineBlack => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.h),
        borderSide: BorderSide.none,
      );
}
