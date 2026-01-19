import 'package:brandy_user/features/cart/presentation/widgets/custom_cart_summary_item_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';

class CustomCartSummaryWidget extends StatelessWidget {
  const CustomCartSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ملخّص الفاتورة",
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
              CustomCartSummaryItemWidget(title: "سعر المنتجات",price: 500,),
              Padding(padding: EdgeInsets.symmetric(
                  vertical: 20.h

              ),child: DottedLine(
                dashColor: AppColors.strokeColor,
              ),),
              CustomCartSummaryItemWidget(title: "التوصيل",price: 20,),
              Padding(padding: EdgeInsets.symmetric(
                  vertical: 20.h

              ),child: DottedLine(
                dashColor: AppColors.strokeColor,
              ),),
              CustomCartSummaryItemWidget(title: "الخصم"),
              Padding(padding: EdgeInsets.symmetric(
                  vertical: 20.h

              ),child: DottedLine(
                dashColor: AppColors.strokeColor,
              ),),
              CustomCartSummaryItemWidget(title: "الإجمالي",price: 520,),
            ],
          ),
        ),
      ],
    );
  }
}
