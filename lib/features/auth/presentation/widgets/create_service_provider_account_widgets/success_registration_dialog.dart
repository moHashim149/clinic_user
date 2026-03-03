import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/framework/spaces.dart';

class SuccessRegistrationDialog extends StatelessWidget {
  const SuccessRegistrationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      backgroundColor: AppColors.whiteColor,
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 112.w,
              height: 112.w,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  AppAssets.simplification,
                  width: 68.w,
                  height: 68.w,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            heightSpace(24.h),
            Text(
              "طلبك قيد المراجعة",
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle20.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
                fontFamily: 'Cairo',
              ),
            ),
            heightSpace(12.h),
            Text(
              "شكرك على صبرك! فريقنا يقوم حالياً بمراجعة طلبك وسنتواصل معك قريباً",
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle14.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.hintColor,
                fontFamily: 'Cairo',
                height: 1.5,
              ),
            ),
            heightSpace(16.h),
          ],
        ),
      ),
    );
  }
}

void showSuccessRegistrationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const SuccessRegistrationDialog(),
  );
}
