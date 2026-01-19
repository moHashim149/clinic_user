import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_colors.dart';

import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/locale_keys.g.dart';

class CustomDeleteAccDialog extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTapDeleteAcc;
  const CustomDeleteAccDialog({
    super.key,
    required this.isLoading,
    required this.onTapDeleteAcc,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: AppColors.secondary4Color,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 18.w,
          bottom: 37.h,
          top: 24.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: SvgPicture.asset(
                AppAssets.close,
                width: 24.w,
                height: 24.h,
              ),
            ),
            heightSpace(13.h),
            Text(
              "هل متأكد من حذف حسابك؟",
              style: AppTextStyles.textStyle20.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),heightSpace(6.h),
            Text(
              "سيتم مسح جميع المعلومات الخاصة بك عند حذف الحساب",
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.blackTextTenthColor,
              ),
            ),
            heightSpace(44.h),
            CustomButton(
              onPressed: onTapDeleteAcc,
              isLoading: isLoading,
              text: "تأكيد حذف الحساب",
              backgroundColor: AppColors.redFifthColor,
            ),
          ],
        ),
      ),
    );
  }
}
