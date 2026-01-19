import 'package:brandy_user/features/product_details/presentation/widgets/custom_count_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_button.dart';

class CustomAddToCartWidget extends StatelessWidget {

  const CustomAddToCartWidget({super.key});

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
          CustomCountWidget(quantity: 1, plusOnTap: (){}, minusOnTap: (){}, deleteOnTap: (){}, showDelete: false),
          widthSpace(32.w),
          Expanded(
            child: CustomButton(
              onPressed: () {},
              height: 43.h,
              borderRadius: BorderRadius.circular(40.r),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.5.w),
                child: Row(
                  children: [
                    Text(
                      "أضف الى السلة",
                      style: AppTextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "25",
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
