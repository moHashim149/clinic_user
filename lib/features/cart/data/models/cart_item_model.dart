import 'package:brandy_user/features/product_details/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_model.g.dart';

@JsonSerializable(createToJson: false)
class CartItemModel {
  int id;
  ProductModel product;
  int count;
  num price;
  num total;
  @JsonKey(name: "price_after_discount")
  num priceAfterDiscount;
  @JsonKey(name: "variant_id")
  int? variantId;

  CartItemModel({
    required this.id,
    required this.product,
    required this.count,
    required this.price,
    required this.total,
    required this.priceAfterDiscount,
    this.variantId,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}
