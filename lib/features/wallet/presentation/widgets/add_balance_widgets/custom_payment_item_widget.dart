import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
            ...List.generate(
              paymentModel.icons.length,
              (index) => Padding(
                padding: EdgeInsetsDirectional.only(end: 4.w),
                child: SvgPicture.asset(
                  paymentModel.icons[index],
                  width: 26.w,
                  height: 26.h,
                ),
              ),
            ),
            widthSpace(5.w),
            Expanded(
              child: Text(
                paymentModel.name.tr(),
                style: AppTextStyles.textStyle12.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Radio(
              value: payment,
              groupValue: paymentModel,
              activeColor: AppColors.primaryColor,
              side: BorderSide(color: AppColors.strokeSecondaryColor),
            ),
          ],
        ).onTap(
          function: () {
            onChanged(paymentModel);
          },
        ),
        if (!isLast) Padding(
          padding:  EdgeInsets.only(top: 16.h,bottom: 18.h),
          child: Divider(thickness: 0.5.w, color: AppColors.strokeSecondaryColor),
        ),
      ],
    );
  }
}
