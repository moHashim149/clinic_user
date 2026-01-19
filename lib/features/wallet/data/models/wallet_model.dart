import 'package:json_annotation/json_annotation.dart';

import 'transaction_model.dart';

part 'wallet_model.g.dart';

@JsonSerializable(createToJson: false)
class WalletModel {
  final num balance;
  final List<TransactionModel> transactions;

  WalletModel({
    required this.balance,
    required this.transactions,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}
