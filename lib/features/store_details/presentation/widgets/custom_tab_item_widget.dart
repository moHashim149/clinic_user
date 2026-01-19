import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class CustomTabItemWidget extends StatelessWidget {
  final bool isActive;
  final String title;
  const CustomTabItemWidget({super.key, required this.isActive, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(
        horizontal: 34.w,
        vertical: 7.h,
      ),
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: isActive
              ? AppColors.primaryColor
              : AppColors.strokeColor,
        ),
        color: isActive
            ? AppColors.secondary3Color
            : null,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        title,
        style: AppTextStyles.textStyle12.copyWith(
          fontWeight: isActive
              ? FontWeight.bold
              : FontWeight.w500,
          color: isActive
              ? AppColors.primaryColor
              : AppColors.hintColor,
        ),
      ),
    );
  }
}
