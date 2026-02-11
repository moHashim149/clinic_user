import 'package:brandy_user/features/product_details/data/models/variation_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../women/data/models/store_model.dart';

part 'available_size_model.g.dart';

@JsonSerializable()
class AvailableSizeModel {
  @JsonKey(name: 'size_id')
  final int sizeId;
  @JsonKey(name: 'size_name')
  final String sizeName;
  final VariationModel variation;


  const AvailableSizeModel({
    required this.sizeId,
    required this.sizeName,
    required this.variation,

  });

  factory AvailableSizeModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableSizeModelFromJson(json);
}
