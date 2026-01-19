// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      amount: json['amount'] as num,
      title: json['title'] as String,
      date: json['date'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      image: json['image'] as String,
    );
