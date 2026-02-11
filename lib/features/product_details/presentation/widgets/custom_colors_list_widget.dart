import 'package:brandy_user/features/product_details/data/models/color_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/framework/spaces.dart';
import 'custom_colors_item_widget.dart';

class CustomColorsListWidget extends StatelessWidget {
  final List<ColorModel> colors;
  final void Function(int index) onSelectColor;
  final int currentColor;
  const CustomColorsListWidget({super.key, required this.colors, required this.onSelectColor, required this.currentColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemBuilder: (context, index) {
          return CustomColorsItemWidget(
            color: colors[index].hex,
            isSelected: currentColor == index,
            onTap: () {
              onSelectColor.call(index);
            },
          );
        },
        separatorBuilder: (context, index) {
          return widthSpace(10.w);
        },
        itemCount: colors.length,
      ),
    );
  }
}
