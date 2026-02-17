import 'package:json_annotation/json_annotation.dart';

import 'cart_item_model.dart';

part 'cart_model.g.dart';

@JsonSerializable(createToJson: false)
class CartModel  {
  int id;
  @JsonKey(name: 'items_total')
  num itemsTotal;
  @JsonKey(name: 'delivery_cost')
  num deliveryCost;
  @JsonKey(name: 'tax_amount')
  num taxAmount;
  @JsonKey(name: 'order_items')
  List<CartItemModel> orderItems;
  @JsonKey(name: 'grand_total')
  num grandTotal;


  CartModel({
    required this.id,
    required this.itemsTotal,
    required this.deliveryCost,
    required this.taxAmount,
    required this.orderItems,
    required this.grandTotal});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

}
