import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/custom_payment_methods_footer_widget.dart';
import '../widgets/custom_payment_methods_list_widget.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "وسائل الدفع"),
      persistentFooterButtons: [CustomPaymentMethodsFooterWidget()],
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: AppColors.whiteColor,
        ),
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),

        child: CustomPaymentMethodsListWidget(),
      ),
    );
  }
}
