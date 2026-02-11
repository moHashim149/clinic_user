import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../generated/locale_keys.g.dart';

class CustomCodeSentSuccessWidget extends StatelessWidget {
  final String phone;

  const CustomCodeSentSuccessWidget({
    super.key,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
       "+966 $phone",
      textDirection: TextDirection.ltr,
      style: AppTextStyles.textStyle14.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.blackTextEighthColor,
      ),
    );
  }
}
