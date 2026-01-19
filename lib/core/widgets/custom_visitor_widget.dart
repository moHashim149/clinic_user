import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';
import '../util/extensions/media_query.dart';
import '../util/extensions/navigation.dart';
import '../util/extensions/on_tap.dart';
import '../util/routing/routes.dart';
import 'custom_button.dart';

class CustomVisitorWidget extends StatelessWidget {
  const CustomVisitorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: 35.h,
        top: 22.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 6.h,
            width: 84.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: AppColors.strokeColor,
            ),
          ),
          heightSpace(40.h),
          SvgPicture.asset(AppAssets.unAuthenticated),
          heightSpace(33.h),
          Text(
            LocaleKeys.youShouldSignIn.tr(),
            style: AppTextStyles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          heightSpace(28.h),
          CustomButton(
            onPressed: () {
              context.pushAndRemoveUntilWithNamed(Routes.signInView);
            },
            text: LocaleKeys.login.tr(),
          ),
        ],
      ),
    );
  }
}
