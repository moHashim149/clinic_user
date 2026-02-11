import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class CustomCartSummaryItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool isPrice;
  const CustomCartSummaryItemWidget({super.key, required this.title, required this.value, this.isPrice = false});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.textStyle10.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: AppTextStyles.textStyle10.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
           if(isPrice)
           ...[
             widthSpace(6.w),
             SvgPicture.asset(
               AppAssets.currency,
               width: 9.w,
               height: 10.h,
             ),
           ]
          ],
        ),
      ],
    );
  }
}
