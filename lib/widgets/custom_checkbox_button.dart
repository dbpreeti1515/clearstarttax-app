import 'package:flutter/material.dart';
import 'package:preeti_s_application3/core/app_export.dart';

class CustomCheckboxButton extends StatelessWidget {
  CustomCheckboxButton({
    Key? key,
    required this.onChange,
    this.decoration,
    this.alignment,
    this.isRightCheck,
    this.iconSize,
    this.value,
    this.text,
    this.width,
    this.padding,
    this.textStyle,
    this.textAlignment,
    this.isExpandedText = false,
  }) : super(
          key: key,
        );

  final BoxDecoration? decoration;

  final Alignment? alignment;

  final bool? isRightCheck;

  final double? iconSize;

  bool? value;

  final Function(bool) onChange;

  final String? text;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final TextStyle? textStyle;

  final TextAlign? textAlignment;

  final bool isExpandedText;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildCheckBoxWidget,
          )
        : buildCheckBoxWidget;
  }

  Widget get buildCheckBoxWidget => InkWell(
        onTap: () {
          value = !(value!);
          onChange(value!);
        },
        child: Container(
          decoration: decoration,
          width: width,
          child: (isRightCheck ?? false) ? rightSideCheckbox : leftSideCheckbox,
        ),
      );
  Widget get leftSideCheckbox => Row(
        children: [
          Padding(
            child: checkboxWidget,
            padding: EdgeInsets.only(right: 8),
          ),
          isExpandedText ? Expanded(child: textWidget) : textWidget,
        ],
      );
  Widget get rightSideCheckbox => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isExpandedText ? Expanded(child: textWidget) : textWidget,
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: checkboxWidget,
          ),
        ],
      );
  Widget get textWidget => Text(
        text ?? "",
        textAlign: textAlignment ?? TextAlign.center,
        style: textStyle ?? CustomTextStyles.bodySmall10,
      );
  Widget get checkboxWidget => SizedBox(
        height: iconSize,
        width: iconSize,
        child: Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(width: 1.0, color: Colors.white),
          ),
          visualDensity: VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          activeColor: Colors.transparent,
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.selected)) {
                return Colors
                    .transparent; // Fill color when checkbox is selected
              }
              if (states.contains(MaterialState.pressed)) {
                return Colors
                    .transparent; // Fill color when checkbox is selected
              }
              return Colors.transparent!; // Fill color when checkbox is not selected
            },
          ),
          overlayColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.transparent;
            }
            return Colors.transparent;
          }),
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          value: value ?? false,
          onChanged: (value) {
            onChange(value!);
          },
        ),
      );
}
