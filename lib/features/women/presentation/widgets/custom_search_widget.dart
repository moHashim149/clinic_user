import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../generated/locale_keys.g.dart';

class CustomSearchWidget extends StatelessWidget {
  final VoidCallback? onSearchTap;
  final bool readOnly;
  final void Function(String)? onChange;
  final TextEditingController? controller;
  const CustomSearchWidget({
    super.key,
    this.onSearchTap,
    required this.readOnly,
    this.controller,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: CustomTextFormField(
        hintText: LocaleKeys.theSearch.tr(),
        readOnly: readOnly,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        prefixIcon: SvgPicture.asset(AppAssets.search, fit: BoxFit.scaleDown),
        fillColor: AppColors.whiteColor,
        borderRadiusValue: 24.r,
        borderColor: AppColors.strokeColor,
        hintStyle: AppTextStyles.textStyle12.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.hintColor,
        ),
        ctrl: controller,
        onTap: onSearchTap,
        onChanged: onChange,
      ),
    );
  }
}
