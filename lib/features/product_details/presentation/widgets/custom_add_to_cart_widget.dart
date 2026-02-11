import 'package:brandy_user/features/product_details/presentation/widgets/custom_count_widget.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_button.dart';

class CustomAddToCartWidget extends StatelessWidget {
  final int quantity;
  final void Function() plusOnTap;
  final void Function() minusOnTap;
  final void Function() onTap;
  final bool onTapLoading;
  final num price;
  const CustomAddToCartWidget({
    super.key,
    required this.quantity,
    required this.plusOnTap,
    required this.minusOnTap,
    required this.price,
    required this.onTap,
    required this.onTapLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17.h),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.strokeColor)),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          CustomCountWidget(
            quantity: quantity,
            plusOnTap: plusOnTap,
            minusOnTap: minusOnTap,
            deleteOnTap: () {},
            showDelete: false,
          ),
          widthSpace(5.w),
          Expanded(
            child: CustomButton(
              onPressed: onTap,
              isLoading: onTapLoading,
              height: 43.h,
              borderRadius: BorderRadius.circular(40.r),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.5.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        LocaleKeys.addToCart.tr(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    Text(
                      "${price * quantity}",
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    widthSpace(4.w),
                    SvgPicture.asset(
                      AppAssets.currency,
                      width: 16.w,
                      height: 16.h,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
