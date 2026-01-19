import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class CustomProfileHeaderWidget extends StatelessWidget {
  const CustomProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ملفي الشخصي",
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        heightSpace(8.h),
        Text(
          "إدارة معلوماتك الشخصية، المفضلة والاعدادت كلها في مكان واحد.",
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.blackTextEighthColor,
          ),
        ),
      ],
    );
  }
}
