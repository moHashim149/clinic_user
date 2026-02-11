import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_text_styles.dart';

class CustomSizesItemWidget extends StatelessWidget {
  final String size;
  final VoidCallback onTap;
  final bool isSelected;
  const CustomSizesItemWidget({super.key, required this.size, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : null,
        border: isSelected ? null : Border.all(color: AppColors.grayTenthColor),
        borderRadius: BorderRadius.circular(24.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Center(
        child: Text(
          size,
          style: AppTextStyles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColors.whiteColor : null,
          ),
        ),
      ),
    ).onTap(function: onTap);
  }
}
