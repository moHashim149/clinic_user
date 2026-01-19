import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/arguments/charge_wallet_argument.dart';
import '../cubits/add_balance_cubit/charge_wallet_cubit.dart';
import '../widgets/add_balance_widgets/custom_input_balance_widget.dart';
import '../widgets/add_balance_widgets/custom_payments_list_widget.dart';

class ChargeWalletView extends StatelessWidget {
  final ChargeWalletArgument argument;

  const ChargeWalletView({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "شحن الرصيد",
      ),
      persistentFooterButtons: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.r)
            ),
            color: AppColors.secondary4Color
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 33.h),
          child: CustomButton(
            onPressed: () {

            },
            text: "شحن",
          ),
        )
      ],
      body: BlocBuilder<ChargeWalletCubit, ChargeWalletState>(
        builder: (context, state) {
          final cubit = context.read<ChargeWalletCubit>();
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("قيمة شحن الرصيد",style: AppTextStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackTextEleventhColor
                ),),
                heightSpace(16.h),
                CustomInputBalanceWidget(cubit: cubit),
                heightSpace(51.h),
                Text("حدد طريقة الدفع",style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackTextEleventhColor
                ),),
                heightSpace(24.h),

                CustomPaymentsListWidget(
                  payments: [],

                  onChanged: (paymentModel) {
                  },
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
