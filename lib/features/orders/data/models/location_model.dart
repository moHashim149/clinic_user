import 'package:brandy_user/features/cart/data/models/cart_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(createToJson: false)
class LocationModel {
  @JsonKey(name: "store_name")
  final String? storeName;
  final String address,lat,lng;

  const LocationModel({
    this.storeName,
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
