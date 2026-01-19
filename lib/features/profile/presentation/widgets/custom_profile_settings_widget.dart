import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import '../views/profile_view.dart';
import 'custom_profile_item_widget.dart';

class CustomProfileSettingsWidget extends StatelessWidget {
  const CustomProfileSettingsWidget({super.key});

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
            icon: AppAssets.mapPin,
            title: "عناويني",
            onTap: () {},
          ),
          heightSpace(20.h),
          CustomProfileItemWidget(
            icon: AppAssets.language,
            title: "تغيير اللغة",
            onTap: () {
              context.pushWithNamed(Routes.languageView);
            },
          ),
          heightSpace(20.h),
          CustomProfileItemWidget(
            icon: AppAssets.theme,
            title: "الوضع الداكن",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
