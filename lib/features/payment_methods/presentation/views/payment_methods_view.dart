import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:brandy_user/core/widgets/custom_error.dart';
import 'package:brandy_user/core/widgets/custom_loading.dart';
import 'package:brandy_user/features/payment_methods/data/data_source/arguments/payment_methods_arguments.dart';
import 'package:brandy_user/features/payment_methods/presentation/cubit/payment_methods_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_bottom_sheet_pay_with_moyser.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../../generated/locale_keys.g.dart';
import '../widgets/custom_payment_methods_footer_widget.dart';
import '../widgets/custom_payment_methods_list_widget.dart';

class PaymentMethodsView extends StatelessWidget {
  final PaymentMethodsArguments arguments;

  const PaymentMethodsView({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.paymentMethods.tr()),
      persistentFooterDecoration: BoxDecoration(),
      persistentFooterButtons: [
        BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
          builder: (context, state) {
            final cubit = context.read<PaymentMethodsCubit>();
            return CustomPaymentMethodsFooterWidget(
              isLoading: state is PlaceOrderLoading,
              total: arguments.total,
              onTap: () {
                if (cubit.payments[cubit.currentPaymentIndex].id == 1 ||
                    cubit.payments[cubit.currentPaymentIndex].id == 2) {
                  cubit.placeOrder(arguments: arguments, context: context);
                } else {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) {
                      return CustomBottomSheetPayWithMoyser(
                        onPaidSuccess: () {
                          cubit.placeOrder(
                            arguments: arguments,
                            context: context,
                          );
                        },
                        onPaidFailed: () {
                          showToast(
                            text: LocaleKeys.failPay.tr(),
                            state: ToastStates.error,
                          );
                        },
                        price: arguments.total,
                        isIos:
                            cubit.payments[cubit.currentPaymentIndex].id == 3,
                      );
                    },
                  );
                }
              },
            );
          },
        ),
      ],
      body: BlocBuilder<PaymentMethodsCubit, PaymentMethodsState>(
        builder: (context, state) {
          final cubit = context.read<PaymentMethodsCubit>();
          if (state is PaymentsLoading) {
            return CustomLoading();
          } else if (state is PaymentsFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                cubit.fetchPayments();
              },
            );
          } else {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.whiteColor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),

              child: CustomPaymentMethodsListWidget(
                payments: cubit.payments,
                currentPayment: cubit.payments[cubit.currentPaymentIndex],
                onChange: (index) {
                  cubit.changePaymentMethod(index);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
