import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import 'custom_sizes_item_widget.dart';

class CustomSizesListWidget extends StatelessWidget {
  const CustomSizesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 33.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemBuilder: (context, index) {
          return CustomSizesItemWidget();
        },
        separatorBuilder: (context, index) {
          return widthSpace(10.w);
        },
        itemCount: 10,
      ),
    );
  }
}