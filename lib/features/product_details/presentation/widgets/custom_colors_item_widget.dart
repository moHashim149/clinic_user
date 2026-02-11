import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class CustomColorsItemWidget extends StatelessWidget {
  final String color;
  final VoidCallback onTap;
  final bool isSelected;
  const CustomColorsItemWidget({super.key, required this.color, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 32.w,
      decoration: BoxDecoration(
        color: Color(int.parse("0xff${color.substring(1)}")),
        border: isSelected ? Border.all(
          color:  AppColors.primaryColor
        ) : null,
        shape: BoxShape.circle,
      ),
    ).onTap(function: onTap);
  }
}
