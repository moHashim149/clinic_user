import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isActive;
  const CustomRadioButton({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      width: 18.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: isActive ? AppColors.primaryColor : AppColors.grayEleventhColor,
              width: isActive ? 5.w : 1.w
          )
      ),
    );
  }
}
