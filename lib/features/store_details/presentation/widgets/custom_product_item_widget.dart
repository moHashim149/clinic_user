import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_image_network.dart';
import 'custom_rounded_icon_widget.dart';

class CustomProductItemWidget extends StatelessWidget {
  final VoidCallback onTap;
  const CustomProductItemWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: AppColors.greyColor,
                ),
              ),
              child: CustomImageNetwork(
                image: AppAssets.testImage,
                heightImage: 97.h,
                widthImage: 101.w,
                radiusValue: 16.r,
              ),
            ),
            widthSpace(12.w),
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    "فستان طويل",
                    style: AppTextStyles.textStyle12
                        .copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  heightSpace(5.h),
                  Text(
                    "فستان حريمي حرير بياققة كاشفة الكتف بدون اكمام",
                    style: AppTextStyles.textStyle10
                        .copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.hintColor,
                    ),
                  ),
                  heightSpace(27.h),
                  Row(
                    children: [
                      Text(
                        "500",
                        style: AppTextStyles.textStyle12
                            .copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.greenColor,
                        ),
                      ),
                      widthSpace(4.w),
                      SvgPicture.asset(
                        AppAssets.currency,
                        color: AppColors.greenColor,
                        width: 13.w,
                        height: 14.h,
                      ),
                      widthSpace(7.w),
                      Text(
                        "500",
                        style: AppTextStyles.textStyle8
                            .copyWith(
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
                      Spacer(),
                      CustomRoundedIconWidget(
                        icon: AppAssets.plus,
                        width: 24.w,
                        height: 24.h,
                        onTap: () {},
                        padding: 6.r,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ).onTap(function: onTap),
        Divider(color: AppColors.strokeColor),
      ],
    );
  }
}
