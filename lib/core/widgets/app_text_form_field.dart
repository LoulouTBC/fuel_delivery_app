import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fuel_delivery_app/core/theming/colors.dart';
import 'package:fuel_delivery_app/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObsecureText;
  final Widget? suffixIcon;
  final Color? fillColor;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.isObsecureText,
    this.suffixIcon,
    this.fillColor,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: fillColor ??
              ColorsManager.moreLightGray, // give me default padding
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                vertical: 18.h,
                horizontal: 20.w,
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorsManager.mainBlue, width: 1.3.w),
                borderRadius: BorderRadius.circular(16),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorsManager.lighterGray, width: 1.3.w),
                borderRadius: BorderRadius.circular(16),
              ),
          hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
          hintText: hintText,
          suffixIcon: suffixIcon),
      obscureText: isObsecureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
    );
  }
}
