import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomSearchDropDownField<T> extends StatelessWidget {
  final List<T> items;
  final String? hintText;

  final void Function(T?) onChanged;
  final String? Function(T? value)? validator;
  final T? value;
  final Widget? prefixIcon;
  final AutovalidateMode? autoValidateMode;
  final Color? fillColor, borderColor;
  final double? borderRadiusValue, borderWidth;

  const CustomSearchDropDownField({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
    this.hintText,
    this.validator,
    this.prefixIcon,
    this.autoValidateMode,
    this.fillColor,
    this.borderColor,
    this.borderRadiusValue,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          isDense: true,
        ),
      ),
      child: CustomDropdown<T>.search(
        hintText: hintText,
        items: items,
        excludeSelected: false,
        validator: validator,
        initialItem: value,
        searchHintText: LocaleKeys.search.tr(),
        hintBuilder: (context, hint, enabled) {
          return Text(
            hint,
            style: AppTextStyles.textStyle10.copyWith(
              color: AppColors.grayColor,
            ),
          );
        },
        headerBuilder: (context, selectedItem, enabled) {
          return Text(
            selectedItem.toString(),
            style: AppTextStyles.textStyle14,
          );
        },
        noResultFoundBuilder: (context, text) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: AppTextStyles.textStyle12,
              ),
            ),
          );
        },
        decoration: CustomDropdownDecoration(
          hintStyle: AppTextStyles.textStyle14.copyWith(
            color: AppColors.hintColor,
          ),
          prefixIcon: prefixIcon,
          closedSuffixIcon: SvgPicture.asset(
            AppAssets.arrowDown,
            fit: BoxFit.scaleDown,
          ),

          errorStyle: AppTextStyles.textStyle12.copyWith(
            color: AppColors.redColor,
          ),
          expandedFillColor: fillColor,
          closedFillColor: fillColor,
          closedBorderRadius: BorderRadius.circular(16.r),
          expandedBorderRadius: BorderRadius.circular(16.r),
          closedErrorBorderRadius: BorderRadius.circular(16.r),
          closedErrorBorder: Border.all(color: AppColors.redColor),
          closedBorder: Border.all(color: borderColor ?? AppColors.borderColor),
        ),
        onChanged: onChanged,
        noResultFoundText: LocaleKeys.emptyData.tr(),
      ),
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
