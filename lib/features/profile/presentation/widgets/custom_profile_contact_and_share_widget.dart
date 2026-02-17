import 'dart:io';

import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/helpers/url_launcher_helper.dart';
import 'custom_profile_item_widget.dart';

class CustomProfileContactAndShareWidget extends StatelessWidget {
  final String androidLink,appleLink;
  const CustomProfileContactAndShareWidget({super.key,required this.androidLink, required this.appleLink});

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
            icon: AppAssets.share,
            title: LocaleKeys.shareApp,
            onTap: () {
              SharePlus.instance.share(
                ShareParams(
                  text: Platform.isIOS
                      ? appleLink
                      : androidLink,
                ),
              );
            },
          ),
          heightSpace(20.h),
          CustomProfileItemWidget(
            icon: AppAssets.sparkle,
            title: LocaleKeys.rateApp,
            onTap: () {
              UrlLauncherHelper.openLink(
                Platform.isIOS
                    ? appleLink
                    : androidLink,
              );
            },
          ),
        ],
      ),
    );
  }
}
