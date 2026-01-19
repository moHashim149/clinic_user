import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';
import '../util/extensions/navigation.dart';
import '../util/extensions/on_tap.dart';

class CustomSheetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomSheetAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparentColor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          Container(
            width: 59.w,
            height: 3.h,
            decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          heightSpace(15.h),
          Text(
            title,
            style: AppTextStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        SvgPicture.asset(AppAssets.close).onTapShadow(
          function: () {
            context.pop();
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.h);
}
