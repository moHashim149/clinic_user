import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/directionality.dart';
import '../../../../core/util/extensions/on_tap.dart';

class CustomProfileItemWidget extends StatelessWidget {
  final String icon, title;
  final VoidCallback onTap;
  const CustomProfileItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 20.w,
          height: 20.h,
          color: AppColors.primaryColor,
        ),
        widthSpace(4.w),
        Expanded(
          child: Text(
            title.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.blackTextEighthColor,
            ),
          ),
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..scale(context.isArabic ? 1.0 : -1.0, 1.0),
          child: SvgPicture.asset(
            AppAssets.arrowForward,
            width: 20.w,
            height: 20.h,
          ),
        ),
      ],
    ).onTap(function: onTap);
  }
}
