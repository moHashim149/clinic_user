// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  status: json['status'] as String,
  date: json['date'] as String,
  storeName: json['store_name'] as String?,
  orderItems: (json['order_items'] as List<dynamic>)
      .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  statusKey: (json['status_key'] as num?)?.toInt(),
  pickup: json['pickup'] == null
      ? null
      : LocationModel.fromJson(json['pickup'] as Map<String, dynamic>),
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  delivery: json['delivery'] == null
      ? null
      : LocationModel.fromJson(json['delivery'] as Map<String, dynamic>),
  courier: json['courier'] == null
      ? null
      : UserModel.fromJson(json['courier'] as Map<String, dynamic>),
  purchase: json['purchase'] == null
      ? null
      : PurchaseModel.fromJson(json['purchase'] as Map<String, dynamic>),
  chatId: (json['chat_id'] as num?)?.toInt(),
);
