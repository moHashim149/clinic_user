import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';

class CustomCountWidget extends StatelessWidget {
  final int quantity;
  final VoidCallback plusOnTap;
  final VoidCallback minusOnTap;
  final VoidCallback deleteOnTap;
  final bool showDelete;
  final double? iconWidth, iconHeight, height, radius, countHorizontalMargin;
  final EdgeInsetsGeometry? padding;
  final TextStyle? countTextStyle;

  const CustomCountWidget({
    super.key,
    required this.quantity,
    required this.plusOnTap,
    required this.minusOnTap,
    required this.deleteOnTap,
    required this.showDelete,
    this.iconWidth,
    this.iconHeight,
    this.height,
    this.countTextStyle,
    this.radius,
    this.padding,
    this.countHorizontalMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 43.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(radius ?? 24.r),
      ),
      padding:
          padding ??
          EdgeInsetsDirectional.only(
            start: 14.w,
            end: 11.w,
            top: 11.5.h,
            bottom: 11.5.h,
          ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.plus,
            width: iconWidth ?? 20.w,
            height: iconHeight ?? 20.h,
          ).onTap(function: plusOnTap),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: countHorizontalMargin ?? 24.w,
            ),
            child: Text(
              "$quantity",
              style:
                  countTextStyle ??
                  AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          SvgPicture.asset(
            showDelete ? AppAssets.delete : AppAssets.minus,
            width: iconWidth ?? 20.w,
            height: iconHeight ?? 20.h,
          ).onTap(function: showDelete ? deleteOnTap : minusOnTap),
        ],
      ),
    );
  }
}
