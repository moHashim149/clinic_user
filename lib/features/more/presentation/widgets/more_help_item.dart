import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreHelpItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const MoreHelpItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        margin: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          children: [
            SvgPicture.asset(icon, height: 24.h, width: 24.w),
            SizedBox(width: 16.w),
            Text(
              title,
              style: AppTextStyles.textStyle14.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              AppAssets.ionChevronBack,
            ),
          ],
        ),
      ),
    );
  }
}
