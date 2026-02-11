import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';
import '../util/extensions/media_query.dart';
import 'custom_button.dart';

class CustomError extends StatelessWidget {
  final String error;

  final void Function() retry;

  const CustomError({super.key, required this.error, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            error == LocaleKeys.noInternetError.tr()
                ? AppAssets.noInternet
                : AppAssets.error,
            width: context.width * 0.3,
            height: context.height * 0.2,
          ),
          heightSpace(24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              error,
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.blackTextSecondaryColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          heightSpace(8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              error == LocaleKeys.noInternetError.tr()
                  ? LocaleKeys.noInternetContent.tr()
                  : LocaleKeys.errorContent.tr(),
              style: AppTextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.blackTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          heightSpace(20.h),
          CustomButton(onPressed: retry, text: LocaleKeys.retry.tr()),
        ],
      ),
    );
  }
}
