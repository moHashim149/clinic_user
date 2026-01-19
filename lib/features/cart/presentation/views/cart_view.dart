import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:brandy_user/features/cart/presentation/widgets/custom_cart_coupon_field_widget.dart';
import 'package:brandy_user/features/cart/presentation/widgets/custom_cart_item_widget.dart';
import 'package:brandy_user/features/cart/presentation/widgets/custom_cart_notes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_cart_address_widget.dart';
import '../widgets/custom_cart_pay_widget.dart';
import '../widgets/custom_cart_privacy_widget.dart';
import '../widgets/custom_cart_summary_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "عربة التسوق"),
      persistentFooterButtons: [
        CustomCartPayWidget()
      ],
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCartAddressWidget(),
            heightSpace(24.h),
            ...List.generate(2, (index) => CustomCartItemWidget(),),
            heightSpace(12.h),
            CustomCartCouponFieldWidget(),
            heightSpace(24.h),
            CustomCartSummaryWidget(),
            heightSpace(24.h),
            CustomCartPrivacyWidget(),
            heightSpace(24.h),
           CustomCartNotesWidget()

          ],
        ),
      ),
    );
  }
}
