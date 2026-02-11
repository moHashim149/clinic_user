import 'package:brandy_user/features/cart/data/models/cart_item_model.dart';
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
  final CartItemModel cartItemModel;
  final VoidCallback plusOnTap, minusOnTap, deleteOnTap;
  const CustomCartItemWidget({
    super.key,
    required this.cartItemModel,
    required this.plusOnTap,
    required this.minusOnTap,
    required this.deleteOnTap,
  });

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
            image: cartItemModel.product.image ?? "",
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
                  cartItemModel.product.name,
                  style: AppTextStyles.textStyle10.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackTextEighthColor,
                  ),
                ),
                heightSpace(10.h),
                Row(
                  children: [
                    Text(
                      "${cartItemModel.priceAfterDiscount == 0 ? cartItemModel.price : cartItemModel.priceAfterDiscount}",
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
                    if (cartItemModel.priceAfterDiscount != 0) ...[
                      widthSpace(5.w),
                      Text(
                        "${cartItemModel.price}",
                        style: AppTextStyles.textStyle8.copyWith(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AppColors.grayColor,
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
                  ],
                ),
              ],
            ),
          ),
          CustomCountWidget(
            quantity: cartItemModel.count,
            plusOnTap: plusOnTap,
            minusOnTap: minusOnTap,
            deleteOnTap: deleteOnTap,
            showDelete: cartItemModel.count == 1,
            iconHeight: 12.h,
            iconWidth: 12.w,
            height: 35.h,
            radius: 13.r,
            countTextStyle: AppTextStyles.textStyle10.copyWith(
              fontWeight: FontWeight.w600,
            ),
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 6.h),
            countHorizontalMargin: 12.w,
          ),
        ],
      ),
    );
  }
}
