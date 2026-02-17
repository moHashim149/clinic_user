import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/util/extensions/on_tap.dart';
import '../../../../core/widgets/custom_image_network.dart';

class CustomStoreItemWidget extends StatelessWidget {
  final String storeName, storeLocation, storeImage;
  final num avgRating, ratesNum, distance;
  final VoidCallback onTap,onFavTap;
  final bool isFav;

  const CustomStoreItemWidget({
    super.key,
    required this.storeName,
    required this.storeLocation,
    required this.storeImage,
    required this.avgRating,
    required this.ratesNum,
    required this.onTap,
    required this.onFavTap,
    required this.distance, required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.grayNinthColor),
          ),
          child: CustomImageNetwork(
            image: storeImage,
            widthImage: 102.w,
            heightImage: 80.h,
            radiusValue: 16.r,
          ),
        ),
        widthSpace(8.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                storeName,
                style: AppTextStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              heightSpace(6.h),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 14.r,
                    color: AppColors.ratingStarColor,
                  ),
                  widthSpace(2.w),
                  Text(
                    "$avgRating",
                    style: AppTextStyles.textStyle10.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if(ratesNum != 0)
                  ...[widthSpace(2.w),
                  Text(
                    "(+ $ratesNum)",
                    style: AppTextStyles.textStyle10.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.grayColor,
                    ),
                  ),]
                ],
              ),
              heightSpace(9.h),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.locationPin,
                    width: 14.w,
                    height: 14.h,
                  ),
                  widthSpace(4.w),
                  Expanded(
                    child: Text(
                      storeLocation,
                      style: AppTextStyles.textStyle8.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackTextNinthColor,
                      ),
                    ),
                  ),
                  if (distance != 0) ...[
                    widthSpace(12.w),
                    SvgPicture.asset(AppAssets.distance),
                    widthSpace(2.w),
                    Text(
                      "$distance km",
                      style: AppTextStyles.textStyle8.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackTextNinthColor,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        SvgPicture.asset(isFav? AppAssets.heartFilled : AppAssets.heart, width: 16.w, height: 16.h).onTap(function: onFavTap),
      ],
    ).onTap(function: onTap);
  }
}
