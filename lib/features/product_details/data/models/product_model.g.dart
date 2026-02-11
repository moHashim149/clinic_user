// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  price: json['price'] as num?,
  priceAfterDiscount: json['price_after_discount'] as num?,
  colors: (json['colors'] as List<dynamic>?)
      ?.map((e) => ColorModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  sizes: (json['sizes'] as List<dynamic>?)
      ?.map((e) => SizeModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  cartQuantity: (json['cart_quantity'] as num?)?.toInt(),
  image: json['image'] as String?,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'price_after_discount': instance.priceAfterDiscount,
      'cart_quantity': instance.cartQuantity,
      'colors': instance.colors,
      'sizes': instance.sizes,
    };
