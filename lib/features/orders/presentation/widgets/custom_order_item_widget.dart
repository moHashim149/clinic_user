import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/features/order_details/data/arguments/order_details_arguments.dart';
import 'package:brandy_user/features/orders/data/models/order_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image_network.dart';

class CustomOrderItemWidget extends StatelessWidget {
  final OrderModel orderModel;
  final VoidCallback onReorder;
  final bool reOrderIsLoading;
  const CustomOrderItemWidget({
    super.key,
    required this.orderModel,
    required this.onReorder,
    required this.reOrderIsLoading,
  });

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
                      orderModel.status,
                      style: AppTextStyles.textStyle8.copyWith(
                        fontWeight: FontWeight.bold,
                        color: orderModel.statusKey == 2
                            ? AppColors.primaryColor
                            : orderModel.statusKey == 3 ||
                                  orderModel.statusKey == 1
                            ? AppColors.yellowColor
                            : orderModel.statusKey == 4
                            ? AppColors.successColor
                            : orderModel.statusKey == 1
                            ? AppColors.thirdColor
                            : AppColors.redColor,
                      ),
                    ),
                    heightSpace(4.h),
                    Text(
                      orderModel.storeName ?? "",
                      style: AppTextStyles.textStyle10.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackTextEighthColor,
                      ),
                    ),
                    heightSpace(4.h),
                    Text(
                      orderModel.date,
                      style: AppTextStyles.textStyle8.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackTextEighthColor,
                      ),
                    ),
                  ],
                ),
              ),
              CustomImageNetwork(
                image: orderModel.orderItems.first.product.image ?? "",
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
                "${orderModel.orderItems.first.priceAfterDiscount == 0 ? orderModel.orderItems.first.price : orderModel.orderItems.first.priceAfterDiscount}",
                style: AppTextStyles.textStyle10.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              widthSpace(6.w),
              SvgPicture.asset(AppAssets.currency, width: 9.w, height: 10.h),
              Spacer(),
              Text(
                "${orderModel.orderItems.first.count} X ${orderModel.orderItems.first.product.name}",
                textDirection: TextDirection.ltr,
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
              if (orderModel.statusKey == 4) ...[
                Expanded(
                  child: CustomButton(
                    onPressed: onReorder,
                    backgroundColor: AppColors.transparentColor,
                    isLoading: reOrderIsLoading,
                    text: LocaleKeys.reOrder.tr(),
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
              ],
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    context.pushWithNamed(
                      Routes.orderDetailsView,
                      arguments: OrderDetailsArguments(orderId: orderModel.id),
                    );
                  },
                  backgroundColor: AppColors.transparentColor,
                  text: LocaleKeys.viewDetails.tr(),
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
