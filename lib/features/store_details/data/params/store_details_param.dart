import 'package:json_annotation/json_annotation.dart';

part 'store_details_param.g.dart';

@JsonSerializable(createFactory: false,includeIfNull: false)
class StoreDetailsParam {
  @JsonKey(includeToJson: false)
  final int storeId;
  final double? lat,lng;

  StoreDetailsParam({
    required this.storeId,
    this.lat,
    this.lng,
});

  Map<String, dynamic> toJson() => _$StoreDetailsParamToJson(this);
}
