import 'package:brandy_user/features/product_details/data/models/color_model.dart';
import 'package:brandy_user/features/product_details/data/models/size_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String name,description;
  final String? image;
  final num? price;
  @JsonKey(name: "price_after_discount")
  final num? priceAfterDiscount;
  @JsonKey(name: "cart_quantity")
  int? cartQuantity;
  final List<ColorModel>? colors;
  final List<SizeModel>? sizes;

   ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.priceAfterDiscount,
    this.colors,
    this.sizes,
    this.cartQuantity,
    this.image,
});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
