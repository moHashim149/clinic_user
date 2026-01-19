import 'package:json_annotation/json_annotation.dart';

part 'sign_in_param.g.dart';

@JsonSerializable(createFactory: false)
class SignInParam {
  final String phone;
  @JsonKey(name: 'device_key')
  final String deviceKey;

  SignInParam({required this.phone, required this.deviceKey});

  Map<String, dynamic> toJson() => _$SignInParamToJson(this);
}
