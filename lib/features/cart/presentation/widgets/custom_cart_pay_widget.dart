import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_button.dart';

class CustomCartPayWidget extends StatelessWidget {
  const CustomCartPayWidget({super.key});

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
                  "الدفع عن طريق",
                  style: AppTextStyles.textStyle8.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.hintColor,
                  ),
                ),
                heightSpace(1.h),
                Text(
                  "المحفظة",
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
              context.pushWithNamed(Routes.paymentMethodsView);
            },
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.secondary4Color,
            ),
            borderRadius: BorderRadius.circular(24.r),
            text: "أدفع الآن",
          ),
        ],
      ),
    );
  }
}
