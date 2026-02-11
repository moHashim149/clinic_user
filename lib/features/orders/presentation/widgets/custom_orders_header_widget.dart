import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class CustomOrdersHeaderWidget extends StatelessWidget {
  const CustomOrdersHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            LocaleKeys.myOrders.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        heightSpace(8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            LocaleKeys.ordersSubtitle.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.blackTextEighthColor,
            ),
          ),
        ),
      ],
    );
  }
}
