// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      amount: json['amount'] as num,
      description: json['description'] as String,
      type: json['type'] as String,
      id: (json['id'] as num).toInt(),
      createdAt: json['created_at'] as String,
    );
