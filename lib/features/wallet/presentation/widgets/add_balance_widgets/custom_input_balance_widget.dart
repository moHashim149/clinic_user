import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../cubits/add_balance_cubit/charge_wallet_cubit.dart';

class CustomInputBalanceWidget extends StatelessWidget {
  final ChargeWalletCubit cubit;

  const CustomInputBalanceWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "أدخل قيمة الشحن",
      ctrl: cubit.balanceCtrl,
      hintStyle: AppTextStyles.textStyle12.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.grayColor,
      ),
      borderRadiusValue: 8.r,
      borderColor: AppColors.strokeSecondaryColor,
      suffixIcon: SvgPicture.asset(
        AppAssets.currency,
        width: 18.w,
        height: 20.h,
        fit: BoxFit.scaleDown,
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}
