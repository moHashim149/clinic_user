import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_button.dart';

class CustomAddBalanceWidget extends StatelessWidget {
  final num balance;

  final Function() onUpdate;

  const CustomAddBalanceWidget({
    super.key,
    required this.balance,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AppAssets.addBalanceBackground,
          width: double.infinity,
          height: 165.h,
        ),
        Column(
          children: [
            Text(
              "رصيدك الحالي",
              style: AppTextStyles.textStyle12.copyWith(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            heightSpace(6.h),
            Row(
              children: [
                Text(
                  "$balance",
                  style: AppTextStyles.textStyle24.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                widthSpace(6.w),
                SvgPicture.asset(
                  AppAssets.currency,
                  color: AppColors.whiteColor,
                  width: 21.w,
                  height: 24.h,
                ),
              ],
            ),
            heightSpace(18.h),
            CustomButton(
              onPressed: () {},
              width: 173.w,
              height: 36.h,
              text: "شحن رصيد",
              backgroundColor: AppColors.secondary3Color,
              style: AppTextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
