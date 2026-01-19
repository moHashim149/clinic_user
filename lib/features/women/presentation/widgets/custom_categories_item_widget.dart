import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_image_network.dart';

class CustomCategoriesItemWidget extends StatelessWidget {
  final String categoryImage, categoryName;
  final void Function() onTap;

  const CustomCategoriesItemWidget({
    super.key,
    required this.categoryImage,
    required this.categoryName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 89.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.strokeColor,width: 0.2.w),
        borderRadius: BorderRadius.circular(50.r),
        color: AppColors.whiteColor
      ),
      padding: EdgeInsets.only(
        top: 6.h,
        right: 6.w,
        left: 6.w,
        bottom: 14.h,
      ),
      child: Column(
        children: [
          CustomImageNetwork(
            image: categoryImage,
            heightImage: 48.h,
            widthImage: 48.w,
            radiusValue: 24.r,
          ),
          heightSpace(6.h),
          Text(
            categoryName,
            style: AppTextStyles.textStyle8.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
