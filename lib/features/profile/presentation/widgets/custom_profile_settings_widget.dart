import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
  final bool isAuth;
  const CustomProfileSettingsWidget({super.key, required this.isAuth});

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
          if (isAuth) ...[
            CustomProfileItemWidget(
              icon: AppAssets.mapPin,
              title: LocaleKeys.myAddresses.tr(),
              onTap: () {
                context.pushWithNamed(Routes.addressesView);
              },
            ),
            heightSpace(20.h),
          ],
          CustomProfileItemWidget(
            icon: AppAssets.language,
            title: LocaleKeys.changeLanguage.tr(),
            onTap: () {
              context.pushWithNamed(Routes.languageView);
            },
          ),
          // heightSpace(20.h),
          // CustomProfileItemWidget(
          //   icon: AppAssets.theme,
          //   title: LocaleKeys.darkMode.tr(),
          //   onTap: () {},
          // ),
        ],
      ),
    );
  }
}
