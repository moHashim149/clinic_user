import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/core/widgets/custom_loading.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/directionality.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class CustomCartCouponFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final bool isCouponApplied, isLoading;
  const CustomCartCouponFieldWidget({
    super.key,
    required this.controller,
    required this.onTap,
    required this.isCouponApplied,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.offersAndCoupons.tr(),
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        heightSpace(12.h),
        CustomTextFormField(
          fillColor: AppColors.secondary4Color,
          hintText: LocaleKeys.couponCodeHint.tr(),
          hintStyle: AppTextStyles.textStyle10.copyWith(
            fontWeight: FontWeight.bold,
          ),
          ctrl: controller,
          borderColor: AppColors.transparentColor,
          borderRadiusValue: 16.r,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 23.h,
          ),
          suffixIcon: isLoading
              ? SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: CustomLoading(
                    widthLoading: 30.w,
                    heightLoading: 30.h,
                    showText: false,
                  ),
                )
              : Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..scale(context.isArabic ? 1.0 : -1.0, 1.0),
                child: SvgPicture.asset(
                    !isCouponApplied ? AppAssets.arrowForward : AppAssets.cancel,
                    fit: BoxFit.scaleDown,
                  ).onTap(function: onTap),
              ),
        ),
      ],
    );
  }
}
