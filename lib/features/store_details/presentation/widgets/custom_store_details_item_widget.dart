import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class CustomStoreDetailsItemWidget extends StatelessWidget {
  final String title, icon, body;
  const CustomStoreDetailsItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(icon,width: 12.w,height: 12.h,),
            widthSpace(2.w),
            Text(
              title,
              style: AppTextStyles.textStyle6.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.blackTextNinthColor,
              ),
            ),
          ],
        ),
        heightSpace(4.h),
        Text(
          body,
          style: AppTextStyles.textStyle10.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}