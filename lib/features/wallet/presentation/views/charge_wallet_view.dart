import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_bottom_sheet_pay_with_moyser.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../data/arguments/charge_wallet_argument.dart';
import '../cubits/add_balance_cubit/charge_wallet_cubit.dart';
import '../widgets/add_balance_widgets/custom_input_balance_widget.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import '../widgets/add_balance_widgets/custom_payments_list_widget.dart';

class ChargeWalletView extends StatelessWidget {
  final ChargeWalletArgument argument;

  const ChargeWalletView({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.chargeWallet.tr()),
      persistentFooterDecoration: BoxDecoration(),
      persistentFooterButtons: [
        BlocBuilder<ChargeWalletCubit, ChargeWalletState>(
          builder: (context, state) {
            final cubit = context.read<ChargeWalletCubit>();
            return cubit.payments.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.r),
                      ),
                      color: AppColors.secondary4Color,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 33.h,
                    ),
                    child: CustomButton(
                      isLoading: state is ChargeWalletLoading,
                      onPressed: () {
                        if(cubit.formKey.currentState!.validate()) {
                          showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) {
                            return CustomBottomSheetPayWithMoyser(
                              onPaidSuccess: () {
                                cubit.chargeBalance(
                                  onUpdate: argument.onUpdate,
                                  context: context,
                                );
                              },
                              onPaidFailed: () {
                                showToast(
                                  text: LocaleKeys.failPay.tr(),
                                  state: ToastStates.error,
                                );
                              },
                              price: num.parse(cubit.balanceCtrl.text),
                              isIos: cubit.currentPayment!.id == 3,
                            );
                          },
                        );
                        }
                      },
                      text: LocaleKeys.charge.tr(),
                    ),
                  )
                : SizedBox();
          },
        ),
      ],
      body: BlocBuilder<ChargeWalletCubit, ChargeWalletState>(
        builder: (context, state) {
          final cubit = context.read<ChargeWalletCubit>();
          return state is PaymentsLoading
              ? CustomLoading()
              : state is PaymentsFailure
              ? CustomError(
                  error: state.error,
                  retry: () {
                    cubit.fetchPayments();
                  },
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.chargeBalanceAmount.tr(),
                        style: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackTextEleventhColor,
                        ),
                      ),
                      heightSpace(16.h),
                      CustomInputBalanceWidget(cubit: cubit),
                      heightSpace(51.h),
                      Text(
                        LocaleKeys.selectPaymentMethod.tr(),
                        style: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackTextEleventhColor,
                        ),
                      ),
                      heightSpace(24.h),

                      CustomPaymentsListWidget(
                        payments: cubit.payments,
                        onChanged: (paymentModel) {
                          cubit.changePaymentMethod(paymentModel!);
                        },
                        payment: cubit.currentPayment,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
