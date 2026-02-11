import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_acc_param.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class CreateAccParam {
  final String name;
  final String? phone;
  @JsonKey(name: 'fcm_token')
  final String fcmToken;
  @JsonKey(name: 'city_id')
  final int cityId;
  @JsonKey(toJson: _multipartFileToJson)
  final MultipartFile image;

  static MultipartFile? _multipartFileToJson(MultipartFile? file) {
    return file;
  }

  CreateAccParam({
    required this.name,
    this.phone,
    required this.cityId,
    required this.image,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() => _$CreateAccParamToJson(this);
}
