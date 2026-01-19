import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image_network.dart';

class CustomOrderItemWidget extends StatelessWidget {
  const CustomOrderItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.secondary4Color,
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "جديد",
                      style: AppTextStyles.textStyle8.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.thirdColor,
                      ),
                    ),
                    heightSpace(4.h),
                    Text(
                      "Zara",
                      style: AppTextStyles.textStyle10.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackTextEighthColor,
                      ),
                    ),
                    heightSpace(4.h),
                    Text(
                      "25 مايو 2026 01:25 م",
                      style: AppTextStyles.textStyle8.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackTextEighthColor,
                      ),
                    ),
                  ],
                ),
              ),
              CustomImageNetwork(
                image: AppAssets.testImage,
                widthImage: 73.w,
                heightImage: 62.h,
                radiusValue: 8.r,
              ),
            ],
          ),
          heightSpace(6.h),
          Row(
            children: [
              Text(
                "500",
                style: AppTextStyles.textStyle10.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              widthSpace(6.w),
              SvgPicture.asset(AppAssets.currency, width: 9.w, height: 10.h),
              Spacer(),
              Text(
                "2 X معطف",
                style: AppTextStyles.textStyle8.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackTextEighthColor,
                ),
              ),
            ],
          ),
          heightSpace(16.h),
          DottedLine(dashColor: AppColors.strokeColor),
          heightSpace(3.h),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: () {},
                  backgroundColor: AppColors.transparentColor,

                  text: "تتبع الطلب",
                  style: AppTextStyles.textStyle10.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              DottedLine(
                dashColor: AppColors.strokeColor,
                direction: Axis.vertical,
                lineLength: 40.h,
                dashLength: 1,
              ),
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    context.pushWithNamed(Routes.orderDetailsView);
                  },
                  backgroundColor: AppColors.transparentColor,
                  text: "عرض التفاصيل",
                  style: AppTextStyles.textStyle10.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
