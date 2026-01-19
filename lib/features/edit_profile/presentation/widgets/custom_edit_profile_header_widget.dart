import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class CustomEditProfileHeaderWidget extends StatelessWidget {
  const CustomEditProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "بيانات الملف الشخصي",
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        heightSpace(8.h),
        Text(
          "شاهد وعدّل بياناتك الشخصية، معلومات التوصل",
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.blackTextEighthColor,
          ),
        ),
      ],
    );
  }
}
