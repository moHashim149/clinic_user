import 'package:json_annotation/json_annotation.dart';

part 'add_address_param.g.dart';


@JsonSerializable(createFactory: false)
class AddAddressParam {
  final String name, location;
  final double lat,lng;

  AddAddressParam({
    required this.name,
    required this.location,
    required this.lat,
    required this.lng,
});

  Map<String, dynamic> toJson() => _$AddAddressParamToJson(this);


}
