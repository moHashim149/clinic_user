import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/features/payment_methods/data/data_source/arguments/payment_methods_arguments.dart';
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

class CustomCartPayWidget extends StatelessWidget {
  final int locationId;
  final String? couponCode;
  final num total;
  const CustomCartPayWidget({
    super.key,
    required this.locationId,
    this.couponCode,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        color: AppColors.secondary4Color,
      ),
      child: Row(
        children: [
          Container(
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.strokeColor),
            ),
            padding: EdgeInsets.all(2.r),
            child: SvgPicture.asset(AppAssets.wallet),
          ),
          widthSpace(6.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.payVia.tr(),
                  style: AppTextStyles.textStyle8.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.hintColor,
                  ),
                ),
                heightSpace(1.h),
                Text(
                  LocaleKeys.wallet.tr(),
                  style: AppTextStyles.textStyle8.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackTextEighthColor,
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            width: 138.w,
            height: 36.h,
            onPressed: () {
              context.pushWithNamed(
                Routes.paymentMethodsView,
                arguments: PaymentMethodsArguments(
                  locationId: locationId,
                  total: total,
                  couponCode: couponCode,
                ),
              );
            },
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.secondary4Color,
            ),
            borderRadius: BorderRadius.circular(24.r),
            text: LocaleKeys.payNow.tr(),
          ),
        ],
      ),
    );
  }
}
