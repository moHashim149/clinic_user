import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPaymentSummaryWidget extends StatelessWidget {
  final num totalOffers;
  final num payNow;
  final num payLater;

  const CustomPaymentSummaryWidget({
    super.key,
    required this.totalOffers,
    required this.payNow,
    required this.payLater,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "ملخص الطلب",
          style: AppTextStyles.textStyle18.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
            fontFamily: 'Cairo',
          ),
        ),
        heightSpace(16.h),
        _buildRow("إجمالي قيمة العروض", totalOffers),
        heightSpace(8.h),
        _buildRow("الدفع", payNow, isBold: true),
        heightSpace(16.h),
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: Color(0xfffff8e3), // Light yellow from Figma
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  "سيتم دفع ($payNow ر.س) فقط من خلال التطبيق، وباقي المبلغ ($payLater ر.س) يتم دفعه خارج التطبيق عند الوصول للعيادة.",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Cairo',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              widthSpace(8.w),
              Icon(Icons.lightbulb_outline, color: Colors.orange, size: 24.sp),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRow(String label, num value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppAssets.currency,
              width: 14.w,
              height: 16.h,
              color: AppColors.blackColor,
            ),
            widthSpace(4.w),
            Text(
              value.toStringAsFixed(0),
              style: AppTextStyles.textStyle16.copyWith(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
                fontFamily: 'Cairo',
              ),
            ),
          ],
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            fontFamily: 'Cairo',
            color: isBold ? Colors.black : AppColors.grayColor,
          ),
        ),
      ],
    );
  }
}
