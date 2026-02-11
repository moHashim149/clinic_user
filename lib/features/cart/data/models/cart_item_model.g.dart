// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    CartItemModel(
      id: (json['id'] as num).toInt(),
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      count: (json['count'] as num).toInt(),
      price: json['price'] as num,
      total: json['total'] as num,
      priceAfterDiscount: json['price_after_discount'] as num,
      variantId: (json['variant_id'] as num?)?.toInt(),
    );
