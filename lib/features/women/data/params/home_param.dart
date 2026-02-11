import 'package:json_annotation/json_annotation.dart';

part 'home_param.g.dart';


@JsonSerializable(createFactory: false,includeIfNull: false)
class HomeParam {
  @JsonKey(name: "store_type")
  final num storeType;
  final double? lat,lng;

  HomeParam({
    required this.storeType,
    this.lat,
    this.lng,
});

  Map<String, dynamic> toJson() => _$HomeParamToJson(this);


}
