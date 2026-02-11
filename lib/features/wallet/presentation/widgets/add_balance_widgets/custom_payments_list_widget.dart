import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../data/models/payment_model.dart';
import 'custom_payment_item_widget.dart';

class CustomPaymentsListWidget extends StatelessWidget {
  final List<PaymentModel> payments;
  final PaymentModel? payment;
  final ValueChanged<PaymentModel?> onChanged;

  const CustomPaymentsListWidget({
    super.key,
    required this.payments,
    required this.onChanged,
    this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.strokeSecondaryColor),
      ),
      padding: EdgeInsetsDirectional.only(bottom: 9.h, start: 8.w, end: 8.w),
      child: Column(
        children: List.generate(
          payments.length,
          (index) => CustomPaymentItemWidget(
            paymentModel: payments[index],
            payment: payment,
            onChanged: onChanged,
            isLast: payments.length - 1 == index,
          ),
        ),
      ),
    );
  }
}
