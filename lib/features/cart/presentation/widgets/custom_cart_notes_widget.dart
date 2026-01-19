import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class CustomCartNotesWidget extends StatelessWidget {
  const CustomCartNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ملاحظات",
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        heightSpace(12.h),
        CustomTextFormField(
          fillColor: AppColors.secondary4Color,
          hintText: "اذا كانت لديك اي ملاحظات أكتبها لنا هنا",
          hintStyle: AppTextStyles.textStyle8.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.hintColor,
          ),
          borderColor: AppColors.transparentColor,
          borderRadiusValue: 16.r,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 18.h,
          ),
          maxLines: 5,
        ),
      ],
    );
  }
}
