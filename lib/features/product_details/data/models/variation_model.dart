import 'package:json_annotation/json_annotation.dart';

import '../../../women/data/models/store_model.dart';

part 'variation_model.g.dart';

@JsonSerializable()
class VariationModel {
  final int id;
  final num price,quantity;
  @JsonKey(name: 'price_after_discount')
  final num priceAfterDiscount;

  const VariationModel({
    required this.id,
    required this.price,
    required this.priceAfterDiscount,
    required this.quantity,

  });

  factory VariationModel.fromJson(Map<String, dynamic> json) =>
      _$VariationModelFromJson(json);
}
