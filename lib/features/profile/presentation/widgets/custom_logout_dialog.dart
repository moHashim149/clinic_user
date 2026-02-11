import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_colors.dart';

import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/extensions/on_tap.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/locale_keys.g.dart';

class CustomLogoutDialog extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTapLogout;
  const CustomLogoutDialog({
    super.key,
    required this.isLoading,
    required this.onTapLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: AppColors.secondary4Color,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 18.w,
          end: 14.w,
          bottom: 35.h,
          top: 24.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child:
                  SvgPicture.asset(
                    AppAssets.close,
                    width: 24.w,
                    height: 24.h,
                  ).onTap(
                    function: () {
                      context.pop();
                    },
                  ),
            ),
            heightSpace(31.h),
            Text(
              LocaleKeys.sureLogout.tr(),
              style: AppTextStyles.textStyle20.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            heightSpace(32.h),
            CustomButton(
              onPressed: onTapLogout,
              isLoading: isLoading,
              text: LocaleKeys.logout.tr(),
              backgroundColor: AppColors.redFifthColor,
            ),
          ],
        ),
      ),
    );
  }
}
