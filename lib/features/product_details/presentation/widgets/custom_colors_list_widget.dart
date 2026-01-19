import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/framework/spaces.dart';
import 'custom_colors_item_widget.dart';

class CustomColorsListWidget extends StatelessWidget {
  const CustomColorsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemBuilder: (context, index) {
          return CustomColorsItemWidget();
        },
        separatorBuilder: (context, index) {
          return widthSpace(10.w);
        },
        itemCount: 10,
      ),
    );
  }
}
