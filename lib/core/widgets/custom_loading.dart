import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';
import '../util/extensions/media_query.dart';

class CustomLoading extends StatelessWidget {
  final bool? isButton;
  final double? heightLoading, widthLoading, strokeWidth;
  final Color? textColor;
  final bool showText;
  final double? value;

  const CustomLoading({
    super.key,
    this.isButton = false,
    this.value,
    this.heightLoading,
    this.widthLoading,
    this.strokeWidth, this.textColor, this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: isButton == true
          ? SizedBox(
              height: heightLoading ?? 15.h,
              width: widthLoading ?? 15.w,
              child: CircularProgressIndicator(
                value: value,
                color: AppColors.whiteColor,
                backgroundColor: AppColors.borderColor,
                strokeWidth: strokeWidth ?? 3.w,
              ),
            )
          : SizedBox(
              width: context.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssets.loading,
                      width: widthLoading ?? context.width / 2.5,
                      height: heightLoading ?? 100.h,
                    ),
                   if(showText)
                   ...[
                     heightSpace(10.h),
                     Text(
                       LocaleKeys.loading.tr(),
                       style: AppTextStyles.textStyle16.copyWith(
                           fontWeight: FontWeight.w700,
                           color: textColor
                       ),
                       textAlign: TextAlign.center,
                     ),
                   ]
                  ],
                ),
              ),
            ),
    );
  }
}
