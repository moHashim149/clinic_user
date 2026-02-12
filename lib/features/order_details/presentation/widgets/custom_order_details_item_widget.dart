import 'package:brandy_user/features/cart/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_image_network.dart';

class CustomOrderDetailsItemWidget extends StatelessWidget {
  final CartItemModel cartItemModel;
  const CustomOrderDetailsItemWidget({super.key, required this.cartItemModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary4Color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItemModel.product.name,
                  style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackTextEighthColor,
                  ),
                ),
                heightSpace(7.h),
                Row(
                  children: [
                    Text(
                      "${cartItemModel.priceAfterDiscount == 0 ? cartItemModel.price : cartItemModel.priceAfterDiscount}",
                      style: AppTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    widthSpace(7.w),
                    SvgPicture.asset(
                      AppAssets.currency,
                      width: 14.w,
                      height: 16.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
          widthSpace(4.w),
          Text(
            "${cartItemModel.count} X",
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.blackTextEighthColor,
            ),
          ),
          widthSpace(7.w),
          CustomImageNetwork(
            image: cartItemModel.product.image ?? "",
            radiusValue: 8.r,
            heightImage: 62.h,
            widthImage: 73.w,
          ),
        ],
      ),
    );
  }
}
