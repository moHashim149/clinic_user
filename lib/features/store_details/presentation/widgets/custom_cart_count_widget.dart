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

class CustomCartCountWidget extends StatelessWidget {
  final int count;
  final num totalPrice;
  const CustomCartCountWidget({super.key, required this.count, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 13.h),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.strokeColor)),
        color: AppColors.whiteColor,
      ),
      child: CustomButton(
        onPressed: () {
          context.pushWithNamed(Routes.cartView);
        },
        borderRadius: BorderRadius.circular(40.r),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Row(
            children: [
              Container(
                height: 32.h,
                width: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.secondary3Color,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "$count",
                    style: AppTextStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              widthSpace(17.w),
              Text(
                "${totalPrice}",
                style: AppTextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
              widthSpace(4.w),
              SvgPicture.asset(
                AppAssets.currency,
                width: 16.w,
                height: 16.h,
                color: AppColors.whiteColor,
              ),
              Spacer(),
              Text(
                LocaleKeys.viewCart.tr(),
                style: AppTextStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
