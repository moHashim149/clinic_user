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

class CustomLoginExpiredDialog extends StatelessWidget {
  const CustomLoginExpiredDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        backgroundColor: AppColors.whiteColor,
        child: Padding(
          padding: EdgeInsets.only(
            left: 11.w,
            right: 11.w,
            bottom: 31.h,
            top: 16.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: SvgPicture.asset(AppAssets.cancel).onTap(
                  function: () {
                    context.pop();
                  },
                ),
              ),
              heightSpace(22.h),
              SvgPicture.asset(
                AppAssets.unAuthenticated,
                height: context.height * 0.08,
              ),
              heightSpace(17.h),
              Text(
                LocaleKeys.unAuthenticated.tr(),
                style: AppTextStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              heightSpace(8.h),
              Text(
                LocaleKeys.youShouldSignIn.tr(),
                style: AppTextStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.grayFourthColor
                ),
                textAlign: TextAlign.center,
              ),
              heightSpace(32.h),
              CustomButton(
                onPressed: () {
                  context.pushAndRemoveUntilWithNamed(Routes.signInView);
                },
                text: LocaleKeys.login.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
