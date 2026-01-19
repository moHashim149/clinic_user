import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class CustomRadioWidget extends StatelessWidget {
  final bool isSelected;
  const CustomRadioWidget({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.h,
      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.5.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : null,
        shape: BoxShape.circle,
        border: isSelected ? null : Border.all(color: AppColors.borderColor),
      ),
      child: isSelected ? Icon(Icons.check,color: AppColors.whiteColor,size: 20.r,) : null,
    );
  }
}
