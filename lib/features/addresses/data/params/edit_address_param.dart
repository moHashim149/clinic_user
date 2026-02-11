import 'package:json_annotation/json_annotation.dart';

part 'edit_address_param.g.dart';


@JsonSerializable(createFactory: false)
class EditAddressParam {
  @JsonKey(includeToJson: false)
  final int id;
  final String name, location;
  final double lat,lng;

  EditAddressParam({
    required this.name,
    required this.id,
    required this.location,
    required this.lat,
    required this.lng,
});

  Map<String, dynamic> toJson() => _$EditAddressParamToJson(this);


}
