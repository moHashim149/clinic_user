import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPaymentMethodItemWidget extends StatelessWidget {
  final String title;
  final Widget logo;
  final bool isSelected;
  final VoidCallback onTap;
  final Widget? trailing;

  const CustomPaymentMethodItemWidget({
    super.key,
    required this.title,
    required this.logo,
    required this.isSelected,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                logo,
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',
                        color: AppColors.blackColor,
                      ),
                    ),
                    widthSpace(16.w),
                    trailing ??
                        (isSelected
                            ? Icon(
                                Icons.radio_button_checked,
                                color: AppColors.primaryColor,
                                size: 20.sp,
                              )
                            : Icon(
                                Icons.radio_button_off,
                                color: AppColors.grayColor,
                                size: 20.sp,
                              )),
                  ],
                ),
              ],
            ),
          ),
          Divider(color: AppColors.stroke, thickness: 0.5.h),
        ],
      ),
    );
  }
}
