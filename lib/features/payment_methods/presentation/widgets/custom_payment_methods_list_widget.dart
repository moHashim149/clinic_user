import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/features/payment_methods/presentation/widgets/custom_payment_methods_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class CustomPaymentMethodsListWidget extends StatelessWidget {
  const CustomPaymentMethodsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      itemBuilder: (context, index) {
        return CustomPaymentMethodsItemWidget(
          isActive: index == 0,
          title: "محفظة",
          onTap: (){},
          icon: AppAssets.wallet,
        );
      },
      separatorBuilder: (context, index) {
        return Divider(thickness: 0.5.w, color: AppColors.grayEleventhColor);
      },
      itemCount: 4,
    );
  }
}
