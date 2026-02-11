import 'package:brandy_user/features/cart/data/models/cart_item_model.dart';
import 'package:brandy_user/features/orders/data/models/via_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'purchase_model.g.dart';

@JsonSerializable(createToJson: false)
class PurchaseModel {
  @JsonKey(name: "sub_total")
  final num subTotal;
  @JsonKey(name: "total_amount")
  final num totalAmount;
  @JsonKey(name: "delivery_cost")
  final num deliveryCost;
  @JsonKey(name: "tax_amount")
  final num taxAmount;
  final num discount;
  final ViaModel via;

  const PurchaseModel({
    required this.subTotal,
    required this.totalAmount,
    required this.discount,
    required this.deliveryCost,
    required this.taxAmount,
    required this.via,
  });

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);
}
