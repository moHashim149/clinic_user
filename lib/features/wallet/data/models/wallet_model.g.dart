// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => WalletModel(
  balance: json['balance'] as num,
  transactions: (json['transactions'] as List<dynamic>)
      .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);
