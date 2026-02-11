import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class CustomCartPrivacyWidget extends StatelessWidget {
  const CustomCartPrivacyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 14.w,
        end: 14.w,
        top: 20.h,
        bottom: 12.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.secondary4Color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.returnPolicy.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          heightSpace(11.h),
          Text(
            LocaleKeys.exchangeTerms.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.greySecondaryColor,
            ),
          ),
          Text(
            LocaleKeys.noChildrenInSalon.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            LocaleKeys.come10MinBefore.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          heightSpace(18.h),
          Text(
            LocaleKeys.returnTerms.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.greySecondaryColor,
            ),
          ),
          heightSpace(9.h),
          Text(
            LocaleKeys.noReturnAfter24Hours.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
