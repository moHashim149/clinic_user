import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class CustomCartCouponFieldWidget extends StatelessWidget {
  const CustomCartCouponFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "عروض & أكواد خصم",
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        heightSpace(12.h),
        CustomTextFormField(
          fillColor: AppColors.secondary4Color,
          hintText: "أدخال كود خصم",
          hintStyle: AppTextStyles.textStyle10.copyWith(
            fontWeight: FontWeight.bold,
          ),
          borderColor: AppColors.transparentColor,
          borderRadiusValue: 16.r,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 23.h,
          ),
          suffixIcon: SvgPicture.asset(
            AppAssets.arrowForward,
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}
