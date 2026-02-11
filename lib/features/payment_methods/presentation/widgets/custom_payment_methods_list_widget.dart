import 'package:brandy_user/features/payment_methods/presentation/widgets/custom_payment_methods_item_widget.dart';
import 'package:brandy_user/features/wallet/data/models/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class CustomPaymentMethodsListWidget extends StatelessWidget {
  final List<PaymentModel> payments;
  final PaymentModel? currentPayment;
  final Function(int index) onChange;
  const CustomPaymentMethodsListWidget({
    super.key,
    required this.payments,
    this.currentPayment,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      itemBuilder: (context, index) {
        return CustomPaymentMethodsItemWidget(
          isActive: currentPayment == payments[index],
          title: payments[index].name,
          onTap: () {
            onChange(index);
          },
          icon: payments[index].image,
        );
      },
      separatorBuilder: (context, index) {
        return Divider(thickness: 0.5.w, color: AppColors.grayEleventhColor);
      },
      itemCount: payments.length,
    );
  }
}
