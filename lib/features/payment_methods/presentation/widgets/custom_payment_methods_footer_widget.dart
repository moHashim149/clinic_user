import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_visitor_widget.dart';

class CustomPaymentMethodsFooterWidget extends StatelessWidget {
  final num total;
  final VoidCallback onTap;
  final bool isLoading;
  const CustomPaymentMethodsFooterWidget({
    super.key,
    required this.total,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 33.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        color: AppColors.whiteColor,
      ),
      child: CustomButton(
        height: 52.h,
        onPressed: onTap,
        borderRadius: BorderRadius.circular(24.r),
        isLoading: isLoading,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.payNow.tr(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.textStyle14.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: VerticalDivider(
                color: AppColors.whiteColor,
                thickness: 2.w,
                indent: 13.h,
                endIndent: 13.h,
              ),
            ),
            Text(
              "$total",
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
            widthSpace(6.w),
            SvgPicture.asset(
              AppAssets.currency,
              color: AppColors.whiteColor,
              width: 17.w,
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
