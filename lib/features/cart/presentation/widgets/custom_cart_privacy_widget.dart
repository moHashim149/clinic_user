import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class CustomCartPrivacyWidget extends StatelessWidget {
  const CustomCartPrivacyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
            "سياسة الاستبدال والاسترجاع",
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          heightSpace(11.h),
          Text(
            "شروط الاستبدال",
            style: AppTextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.greySecondaryColor
            ),
          ),
          Text(
            "يجب عدم اصطحاب الأطفال الى الصالون.",
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),Text(
            "يفضل المجئ الى الصالون قبل الموعد ب 10د.",
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          heightSpace(18.h),
          Text(
            "شروط الاسترجاع",
            style: AppTextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.greySecondaryColor
            ),
          ),heightSpace(9.h),
          Text(
            "لايمكن الاسترجاع بعد مرور 24 ساعة على الحجز أو قبل الحجز ب 24 ساعة",
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
