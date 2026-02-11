import 'package:brandy_user/features/orders/data/models/location_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class CustomOrderPickupDeliveryWidget extends StatelessWidget {
  final LocationModel pickup,delivery;
  const CustomOrderPickupDeliveryWidget({super.key, required this.pickup, required this.delivery});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: AppColors.secondary4Color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.only(
        top: 14.h,
        left: 12.w,
        right: 12.w,
        bottom: 16.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                AppAssets.location,
                width: 20.w,
                height: 20.h,
              ),
              DottedLine(
                direction: Axis.vertical,
                lineLength: 65.h,
                dashColor: AppColors.strokeColor,
              ),
              SvgPicture.asset(
                AppAssets.location,
                width: 20.w,
                height: 20.h,
              ),
            ],
          ),
          widthSpace(8.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 pickup.storeName ?? "",
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                heightSpace(4.h),
                Text(
                 pickup.address,
                  style: AppTextStyles.textStyle10.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.hintColor,
                  ),
                ),
                heightSpace(40.h),

                Text(
                  delivery.address,
                  style: AppTextStyles.textStyle10.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.hintColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
