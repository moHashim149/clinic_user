import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class CustomAcceptTermsAndCondWidget extends StatelessWidget {
  const CustomAcceptTermsAndCondWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "بإنشاء حسابك، فإنك توافق على\t",
        style: AppTextStyles.textStyle12.copyWith(
          color: AppColors.blackTextEighthColor,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: "الشروط والأحكام",
            style: AppTextStyles.textStyle12.copyWith(
              decorationColor: AppColors.primaryColor,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(
            text: "\tو\t",
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.blackTextEighthColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: "سياسة الخصوصية",
            style: AppTextStyles.textStyle12.copyWith(
              decorationColor: AppColors.primaryColor,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(
            text: "\tلتطبيق براندي",
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.blackTextEighthColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
