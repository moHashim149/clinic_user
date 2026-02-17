import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';

class CustomWalletTransactionItemWidget extends StatelessWidget {
  final String title, date;
  final bool isSuccess;
  final num balance;
  const CustomWalletTransactionItemWidget({
    super.key,
    required this.title,
    required this.balance,
    required this.date,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(AppAssets.transaction),
        widthSpace(16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.textStyle12.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              heightSpace(4.h),
              Text(
                date,
                style: AppTextStyles.textStyle10.copyWith(
                  color: AppColors.grayColor,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(31.r),
                color: isSuccess
                    ? AppColors.greenOpacityColor
                    : AppColors.redOpacityColor,
              ),
              child: Text(
                isSuccess ? LocaleKeys.success.tr() : LocaleKeys.failed.tr(),
                style: AppTextStyles.textStyle12.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isSuccess
                      ? AppColors.greenColor
                      : AppColors.redSexColor,
                ),
              ),
            ),
            heightSpace(10.h),
            Row(
              children: [
                Text(
                  "$balance",
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                widthSpace(8.w),
                SvgPicture.asset(AppAssets.currency, width: 14.w, height: 16.h),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
