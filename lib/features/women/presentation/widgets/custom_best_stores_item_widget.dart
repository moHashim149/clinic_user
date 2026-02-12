import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/util/extensions/on_tap.dart';
import '../../../../core/widgets/custom_image_network.dart';

class CustomBestStoresItemWidget extends StatelessWidget {
  final String storeName, time, storeImage, deliveryCost;
  final VoidCallback onTap;

  const CustomBestStoresItemWidget({
    super.key,
    required this.storeName,
    required this.storeImage,
    required this.time,
    required this.deliveryCost,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.strokeColor),
      ),
      child: Row(
        children: [
          CustomImageNetwork(
            image: storeImage,
            widthImage: 84.w,
            heightImage: 58.h,
          ),
          VerticalDivider(color: AppColors.strokeColor, width: 1.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeName,
                    style: AppTextStyles.textStyle10.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTextEighthColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  heightSpace(6.h),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.delivery),
                      widthSpace(2.w),
                      Text(
                        deliveryCost,
                        style: AppTextStyles.textStyle8.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.hintColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).onTap(function: onTap);
  }
}
