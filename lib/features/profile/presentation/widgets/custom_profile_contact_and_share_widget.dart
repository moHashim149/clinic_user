import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/framework/spaces.dart';
import 'custom_profile_item_widget.dart';

class CustomProfileContactAndShareWidget extends StatelessWidget {
  const CustomProfileContactAndShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary4Color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 20.h,
      ),
      child: Column(
        children: [
          CustomProfileItemWidget(
            icon: AppAssets.share,
            title: "مشاركة التطبيق",
            onTap: () {},
          ),
          heightSpace(20.h),
          CustomProfileItemWidget(
            icon: AppAssets.sparkle,
            title: "تقييم التطبيق",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
