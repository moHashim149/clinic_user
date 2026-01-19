import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../core/constants/app_colors.dart';

class CustomAuthHeader extends StatelessWidget {
  final String title,body;
  const CustomAuthHeader({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace(32.h),
        Text(
          title,
          style: AppTextStyles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.blackTextEighthColor,
          ),
        ),
        heightSpace(12.h),
        Text(
          body,
          style: AppTextStyles.textStyle14.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.hintColor,
          ),
        ),
      ],
    );
  }
}
