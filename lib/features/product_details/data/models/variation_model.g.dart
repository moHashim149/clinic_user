// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariationModel _$VariationModelFromJson(Map<String, dynamic> json) =>
    VariationModel(
      id: (json['id'] as num).toInt(),
      price: json['price'] as num,
      priceAfterDiscount: json['price_after_discount'] as num,
      quantity: json['quantity'] as num,
    );

Map<String, dynamic> _$VariationModelToJson(VariationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'quantity': instance.quantity,
      'price_after_discount': instance.priceAfterDiscount,
    };
