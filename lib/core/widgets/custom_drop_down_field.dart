import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/app_text_styles.dart';

class CustomDropDownField<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final String? hintText;

  final void Function(T?) onChanged;
  final String? Function(T? value)? validator;
  final T? value;
  final double? borderRadiusValue;
  final AutovalidateMode? autoValidateMode;
  final Color? fillColor, borderColor;
  final Widget? prefixIcon;

  const CustomDropDownField({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    this.hintText,
    this.validator,
    this.autoValidateMode,
    this.fillColor,
    this.borderColor,
    this.prefixIcon,
    this.borderRadiusValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      items: items,
      hint: hintText != null
          ? Text(
              hintText!,
              style: AppTextStyles.textStyle12.copyWith(
                color: AppColors.hintColor,
                fontWeight: FontWeight.w500,
              ),
            )
          : null,
      validator: validator,
      isDense: true,
      iconSize: 24.r,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
      icon: SvgPicture.asset(
        AppAssets.arrowDown,
        fit: BoxFit.scaleDown,
        color: AppColors.blackColor,
      ),
      iconEnabledColor: AppColors.blackColor,
      borderRadius: BorderRadius.circular(16.r),
      padding: EdgeInsets.zero,
      style: AppTextStyles.textStyle12.copyWith(
        fontWeight: FontWeight.w500,
        fontFamily: AppConstants.fontFamily,
      ),
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: prefixIcon,
        border: buildOutlineInputBorder(borderColor),
        enabledBorder: buildOutlineInputBorder(borderColor),
        errorBorder: buildOutlineInputBorder(AppColors.redColor),
        focusedErrorBorder: buildOutlineInputBorder(AppColors.redColor),
        errorStyle: AppTextStyles.textStyle12.copyWith(
          color: AppColors.redColor,
        ),
        hintStyle: AppTextStyles.textStyle10.copyWith(
          color: AppColors.grayColor,
        ),
        contentPadding: EdgeInsetsDirectional.only(
          top: 14.h,
          bottom: 14.h,
          end: 16.w,
          start: 16.w,
        ),
        focusedBorder: buildOutlineInputBorder(borderColor),
        filled: true,
        fillColor: fillColor ?? AppColors.transparentColor,
      ),
      onChanged: onChanged,
    );
  }

  OutlineInputBorder buildOutlineInputBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusValue ?? 16.r),
      borderSide: BorderSide(color: color ?? AppColors.strokeColor),
    );
  }
}
