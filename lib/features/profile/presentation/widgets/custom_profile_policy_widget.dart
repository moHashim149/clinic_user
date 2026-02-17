import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import 'custom_profile_item_widget.dart';

class CustomProfilePolicyWidget extends StatelessWidget {
  const CustomProfilePolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary4Color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
      child: Column(
        children: [
          CustomProfileItemWidget(
            icon: AppAssets.policy,
            title: LocaleKeys.privacyPolicy,
            onTap: () {
              context.pushWithNamed(Routes.policyView);
            },
          ),
          heightSpace(20.h),
          CustomProfileItemWidget(
            icon: AppAssets.terms,
            title: LocaleKeys.terms,
            onTap: () {
              context.pushWithNamed(Routes.termsView);
            },
          ),
        ],
      ),
    );
  }
}
