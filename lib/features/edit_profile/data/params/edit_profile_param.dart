
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_param.g.dart';

@JsonSerializable(createFactory: false,includeIfNull: false)
class EditProfileParam {
  final String name, email,phone;
  @JsonKey(toJson: _multipartFileToJson)
  final MultipartFile? image;


  EditProfileParam({
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
  });

  static MultipartFile? _multipartFileToJson(MultipartFile? file) {
    return file;
  }



  Map<String, dynamic> toJson() => _$EditProfileParamToJson(this);
}
