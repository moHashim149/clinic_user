import 'package:brandy_user/core/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/extensions/on_tap.dart';
import '../../../data/models/payment_model.dart';

class CustomPaymentItemWidget extends StatelessWidget {
  final PaymentModel paymentModel;
  final bool isLast;
  final PaymentModel? payment;
  final ValueChanged<PaymentModel?> onChanged;
  final String? walletBalance;
  const CustomPaymentItemWidget({
    super.key,
    required this.paymentModel,
    this.payment,
    this.isLast = false,
    this.walletBalance,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(end: 4.w),
              child: CustomImageNetwork(
                image: paymentModel.image,
                widthImage: 26.w,
                heightImage: 26.h,
              ),
            ),
            widthSpace(5.w),
            Expanded(
              child: Text(
                paymentModel.name,
                style: AppTextStyles.textStyle12.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Radio(
              value: payment,
              groupValue: paymentModel,
              activeColor: AppColors.primaryColor,
              fillColor: WidgetStateProperty.all(AppColors.primaryColor),
              side: BorderSide(color: AppColors.strokeSecondaryColor),
            ),
          ],
        ).onTap(
          function: () {
            onChanged(paymentModel);
          },
        ),
        if (!isLast)
          Divider(
            thickness: 0.5.w,
            color: AppColors.strokeSecondaryColor,
          ),
      ],
    );
  }
}
