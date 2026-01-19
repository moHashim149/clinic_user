import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRoundedIconWidget extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final Color? borderColor,color;
  final double? width,height,padding;
  const CustomRoundedIconWidget({super.key, required this.icon, required this.onTap, this.width, this.height, this.padding, this.borderColor, this.color});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width ?? 40.w,
      height: height ?? 40.h,
      padding: EdgeInsets.all(padding ?? 10.r),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? AppColors.whiteColor,
        border: Border.all(
          width: 0.83.w,
          color: borderColor ?? AppColors.greyColor,
        )
      ),
      child: SvgPicture.asset(icon),
    ).onTap(function: onTap);
  }
}
