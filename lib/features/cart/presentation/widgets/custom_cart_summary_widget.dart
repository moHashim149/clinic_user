import 'package:brandy_user/features/cart/presentation/widgets/custom_cart_summary_item_widget.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class CustomCartSummaryWidget extends StatelessWidget {
  final num cartTotal, deliveryFee, discount, grandTotal;
  final num? tax;
  const CustomCartSummaryWidget({
    super.key,
    required this.cartTotal,
    required this.deliveryFee,
    required this.discount,
    required this.grandTotal, this.tax,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.invoiceSummary.tr(),
          style: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        heightSpace(12.h),
        Container(
          padding: EdgeInsetsDirectional.only(
            start: 14.w,
            end: 14.w,
            top: 23.h,
            bottom: 30.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.secondary4Color,
          ),
          child: Column(
            children: [
              CustomCartSummaryItemWidget(
                title: LocaleKeys.productsPrice.tr(),
                value: cartTotal.toString(),
                isPrice: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: DottedLine(dashColor: AppColors.strokeColor),
              ),
              CustomCartSummaryItemWidget(
                title: LocaleKeys.deliveryFee.tr(),
                value: deliveryFee.toString(),
                isPrice: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: DottedLine(dashColor: AppColors.strokeColor),
              ),
              CustomCartSummaryItemWidget(
                title: LocaleKeys.discount.tr(),
                value: discount.toString(),
                isPrice: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: DottedLine(dashColor: AppColors.strokeColor),
              ),
              if(tax != null)
                ...[
                  CustomCartSummaryItemWidget(
                    title: LocaleKeys.tax.tr(),
                    value: tax.toString(),
                    isPrice: true,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: DottedLine(dashColor: AppColors.strokeColor),
                  ),
                ],
              CustomCartSummaryItemWidget(
                title: LocaleKeys.grandTotal.tr(),
                value: grandTotal.toString(),
                isPrice: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
