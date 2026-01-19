import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_acc_param.g.dart';

@JsonSerializable(createFactory: false,includeIfNull: false)
class CreateAccParam {
  @JsonKey(name: 'f_name')
  final String firstName;
  @JsonKey(name: 'l_name')
  final String lastName;
  final String phone;
  final String whatsapp;
  @JsonKey(name: 'device_key')
  final String deviceKey;
  @JsonKey(name: 'city_id')
  final int cityId;
  @JsonKey(toJson: _multipartFileToJson, name: "img")
  final MultipartFile image;

  static MultipartFile _multipartFileToJson(MultipartFile file) {
    return file;
  }

  CreateAccParam({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.whatsapp,
    required this.deviceKey,
    required this.cityId,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$CreateAccParamToJson(this);
}
