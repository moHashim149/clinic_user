import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_colors.dart';

import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/locale_keys.g.dart';

class CustomDeleteAddressDialog extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTapDeleteAddress;
  const CustomDeleteAddressDialog({
    super.key,
    required this.isLoading,
    required this.onTapDeleteAddress,
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
          end: 18.w,
          bottom: 37.h,
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
            heightSpace(13.h),
            Text(
              LocaleKeys.confirmDeleteAddressTitle.tr(),
              style: AppTextStyles.textStyle20.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            heightSpace(6.h),
            Text(
              LocaleKeys.confirmDeleteAddressMessage.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.blackTextTenthColor,
              ),
            ),
            heightSpace(44.h),
            CustomButton(
              onPressed: onTapDeleteAddress,
              isLoading: isLoading,
              text: LocaleKeys.confirmDeleteAddress.tr(),
              backgroundColor: AppColors.redFifthColor,
            ),
          ],
        ),
      ),
    );
  }
}
