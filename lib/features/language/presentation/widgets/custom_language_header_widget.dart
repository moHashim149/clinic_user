import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class CustomLanguageHeaderWidget extends StatelessWidget {
  const CustomLanguageHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "تغيير اللغة",
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        heightSpace(8.h),
        Text(
          "حدد لغتك المفضلة للحصول على تجربة أفضل",
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.blackTextEighthColor,
          ),
        ),
      ],
    );
  }
}
