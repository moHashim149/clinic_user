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
  final String image, title, desc;
  final num price, priceAfterDiscount;
  final int cartQuantity;
  const CustomProductItemWidget({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
    required this.desc,
    required this.price,
    required this.priceAfterDiscount,
    required this.cartQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: AppColors.greyColor),
              ),
              child: CustomImageNetwork(
                image: image,
                heightImage: 97.h,
                widthImage: 101.w,
                radiusValue: 16.r,
              ),
            ),
            widthSpace(12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  heightSpace(5.h),
                  Text(
                    desc,
                    style: AppTextStyles.textStyle10.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.hintColor,
                    ),
                  ),
                  heightSpace(27.h),
                  Row(
                    children: [
                      Text(
                        "${priceAfterDiscount == 0 ? price : priceAfterDiscount}",
                        style: AppTextStyles.textStyle12.copyWith(
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
                      if (priceAfterDiscount != 0) ...[
                        widthSpace(7.w),
                        Text(
                          "$price",
                          style: AppTextStyles.textStyle8.copyWith(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.grayColor,
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
                      Spacer(),
                      CustomRoundedIconWidget(
                        icon: AppAssets.plus,
                        width: 24.w,
                        height: 24.h,
                        onTap: onTap,
                        padding: 6.r,
                      )
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
