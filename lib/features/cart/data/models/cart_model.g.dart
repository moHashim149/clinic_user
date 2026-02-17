// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
  id: (json['id'] as num).toInt(),
  itemsTotal: json['items_total'] as num,
  deliveryCost: json['delivery_cost'] as num,
  taxAmount: json['tax_amount'] as num,
  orderItems: (json['order_items'] as List<dynamic>)
      .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  grandTotal: json['grand_total'] as num,
);
