import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../generated/locale_keys.g.dart';
import '../cubits/wallet_cubit/wallet_cubit.dart';
import '../widgets/wallet_widgets/custom_add_balance_widget.dart';
import '../widgets/wallet_widgets/custom_wallet_transactions_list_widget.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.myWallet.tr()),
      body: BlocBuilder<WalletCubit, WalletState>(
        builder: (context, state) {
          final cubit = context.read<WalletCubit>();
          return state is GetWalletLoading
              ? CustomLoading()
              : state is GetWalletFailure
              ? CustomError(
                  error: state.error,
                  retry: () {
                    cubit.fetchWallet();
                  },
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.walletSubtitle.tr(),
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackTextEighthColor,
                        ),
                      ),
                      heightSpace(27.h),
                      CustomAddBalanceWidget(
                        balance: cubit.walletModel!.balance,
                        onUpdate: () {
                          cubit.fetchWallet();
                        },
                      ),
                      heightSpace(32.h),
                      Text(
                        LocaleKeys.transactions.tr(),
                        style: AppTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomWalletTransactionsListWidget(
                        transactions: cubit.walletModel!.transactions,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
