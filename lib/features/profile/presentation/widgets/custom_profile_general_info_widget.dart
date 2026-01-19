import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/framework/spaces.dart';
import '../views/profile_view.dart';
import 'custom_profile_item_widget.dart';

class CustomProfileGeneralInfoWidget extends StatelessWidget {
  const CustomProfileGeneralInfoWidget({super.key});

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
            icon: AppAssets.profile,
            title: "بيانات الملف الشخصي",
            onTap: () {
              context.pushWithNamed(Routes.editProfileView);
            },
          ),
          heightSpace(24.h),
          CustomProfileItemWidget(
            icon: AppAssets.wallet,
            title: "محفظتي",
            onTap: () {
              context.pushWithNamed(Routes.walletView);
            },
          ),
        ],
      ),
    );
  }
}
