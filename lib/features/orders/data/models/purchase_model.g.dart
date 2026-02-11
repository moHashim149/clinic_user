// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseModel _$PurchaseModelFromJson(Map<String, dynamic> json) =>
    PurchaseModel(
      subTotal: json['sub_total'] as num,
      totalAmount: json['total_amount'] as num,
      discount: json['discount'] as num,
      deliveryCost: json['delivery_cost'] as num,
      taxAmount: json['tax_amount'] as num,
      via: ViaModel.fromJson(json['via'] as Map<String, dynamic>),
    );
