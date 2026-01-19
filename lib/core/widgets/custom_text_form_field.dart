import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? ctrl;
  final String? hintText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final bool isUnderlineInputBorder, readOnly;
  final int? maxLines, maxLength;
  final double? borderRadiusValue, borderWidth;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor, borderColor;
  final TextStyle? hintStyle;

  final void Function(String)? onChanged;
  final void Function()? onTap;

  final AutovalidateMode? autoValidateMode;

  const CustomTextFormField({
    super.key,
    this.ctrl,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction,
    this.isUnderlineInputBorder = false,
    this.hintStyle,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.maxLines,
    this.autoValidateMode,
    this.onChanged,
    this.enabled,
    this.onTap,
    this.borderRadiusValue,
    this.maxLength,
    this.contentPadding,
    this.fillColor,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: ctrl,
      focusNode: focusNode,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      enabled: enabled,
      onTap: onTap,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      style: AppTextStyles.textStyle14,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      validator: validator,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: textInputAction ?? TextInputAction.next,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? AppColors.transparentColor,
        border: buildOutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle:
            hintStyle ??
            AppTextStyles.textStyle10.copyWith(color: AppColors.grayColor),
        focusedBorder: buildOutlineInputBorder(
          borderColor ?? AppColors.strokeColor,
          isUnderlineInputBorder,
        ),
        enabledBorder: buildOutlineInputBorder(
          borderColor ?? AppColors.strokeColor,
          isUnderlineInputBorder,
        ),
        errorBorder: buildOutlineInputBorder(AppColors.redColor),
        focusedErrorBorder: buildOutlineInputBorder(AppColors.redColor),
        disabledBorder: buildOutlineInputBorder(
          borderColor ?? AppColors.strokeColor,
          isUnderlineInputBorder,
        ),
        errorStyle: AppTextStyles.textStyle12.copyWith(
          color: AppColors.redColor,
        ),
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      ),
      onChanged: onChanged,
    );
  }

  InputBorder buildOutlineInputBorder([
    Color? color,
    bool isUnderlineBorder = false,
  ]) {
    return isUnderlineBorder
        ? UnderlineInputBorder(
            borderSide: color != null
                ? BorderSide(color: color)
                : BorderSide.none,
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue ?? 16.r),
            borderSide: color != null
                ? BorderSide(color: color, width: borderWidth ?? 1)
                : BorderSide.none,
          );
  }
}
