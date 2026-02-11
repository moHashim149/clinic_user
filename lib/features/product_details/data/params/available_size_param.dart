import 'package:json_annotation/json_annotation.dart';

part 'available_size_param.g.dart';

@JsonSerializable(createFactory: false)
class AvailableSizeParam {
  @JsonKey(name: "color_id")
  final int colorId;
  @JsonKey(includeToJson: false)
  final int productId; 

  AvailableSizeParam({required this.colorId, required this.productId});

  Map<String, dynamic> toJson() => _$AvailableSizeParamToJson(this);
}
