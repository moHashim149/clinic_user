import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../data/models/transaction_model.dart';
import 'custom_wallet_transaction_item_widget.dart';

class CustomWalletTransactionsListWidget extends StatelessWidget {
  final List<TransactionModel> transactions;

  const CustomWalletTransactionsListWidget({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: transactions.isEmpty
          ? Center(
            child: Text(
                "لاتوجد معاملات لديك!",
                style: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.blackTextEighthColor,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
          )
          : ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemBuilder: (context, index) =>
                  CustomWalletTransactionItemWidget(
                    title: transactions[index].title,
                    balance: 500,
                    date: transactions[index].date,
                   isSuccess: true,
                  ),
              separatorBuilder: (context, index) => heightSpace(48.h),
              itemCount: transactions.length,
            ),
    );
  }
}
