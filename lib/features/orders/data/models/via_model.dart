import 'package:brandy_user/features/cart/data/models/cart_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'via_model.g.dart';

@JsonSerializable(createToJson: false)
class ViaModel {
  final String label,image;

  const ViaModel({
    required this.label,
    required this.image,
  });

  factory ViaModel.fromJson(Map<String, dynamic> json) =>
      _$ViaModelFromJson(json);
}
