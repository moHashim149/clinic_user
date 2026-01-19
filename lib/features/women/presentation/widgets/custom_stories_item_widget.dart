import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_image_network.dart';

class CustomStoriesItemWidget extends StatelessWidget {
  final String storeImage, storeName, storeAvgRate, storyThumbnail;
  final void Function() onTap;

  const CustomStoriesItemWidget({
    super.key,
    required this.storeImage,
    required this.storeName,
    required this.storeAvgRate,
    required this.storyThumbnail,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomImageNetwork(
            image: storyThumbnail,
            widthImage: 112.w,
            heightImage: 153.h,
            radiusValue: 8.r,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
            color: AppColors.blackColor.withOpacity(0.8),
          ),
          padding: EdgeInsets.only(
            top: 12.h,
            right: 8.w,
            left: 8.w,
            bottom: 4.h,
          ),
          child: Row(
            children: [
              CustomImageNetwork(
                image: storeImage,
                heightImage: 24.h,
                widthImage: 24.w,
                radiusValue: 12.r,
              ),
              widthSpace(4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    storeName,
                    style: AppTextStyles.textStyle8.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.star,
                        color: AppColors.secondary2Color,
                        width: 10.w,
                        height: 10.h,
                      ),
                      widthSpace(4.w),
                      Text(
                        storeAvgRate,
                        style: AppTextStyles.textStyle8.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.secondary2Color,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
