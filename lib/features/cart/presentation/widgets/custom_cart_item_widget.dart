import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_image_network.dart';
import '../../../product_details/presentation/widgets/custom_count_widget.dart';

class CustomCartItemWidget extends StatelessWidget {
  const CustomCartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.secondary4Color,
      ),
      child: Row(
        children: [
          CustomImageNetwork(
            image: AppAssets.testImage,
            heightImage: 73.h,
            widthImage: 78.w,
            radiusValue: 8.r,
          ),
          widthSpace(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "طقم ولادي حديثي الولادة",
                  style: AppTextStyles.textStyle10.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackTextEighthColor,
                  ),
                ),
                heightSpace(10.h),
                Row(
                  children: [
                    Text(
                      "500",
                      style: AppTextStyles.textStyle10.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    widthSpace(6.w),
                    SvgPicture.asset(
                      AppAssets.currency,
                      color: AppColors.blackColor,
                      width: 9.w,
                      height: 10.h,
                    ),
                    widthSpace(5.w),
                    Text(
                      "500",
                      style: AppTextStyles.textStyle8.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayColor,
                      ),
                    ),
                    widthSpace(4.w),
                    SvgPicture.asset(
                      AppAssets.currency,
                      color: AppColors.grayColor,
                      width: 9.w,
                      height: 10.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomCountWidget(
            quantity: 1,
            plusOnTap: () {},
            minusOnTap: () {},
            deleteOnTap: () {},
            showDelete: true,
            iconHeight: 12.h,
            iconWidth: 12.w,
            height: 24.h,
            radius: 13.r,
            countTextStyle: AppTextStyles.textStyle10.copyWith(
              fontWeight: FontWeight.w600,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 13.w,
              vertical: 6.h,
            ),
            countHorizontalMargin: 12.w,
          ),
        ],
      ),
    );
  }
}
