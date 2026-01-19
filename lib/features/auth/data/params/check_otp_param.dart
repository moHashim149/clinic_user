import 'package:json_annotation/json_annotation.dart';

part 'check_otp_param.g.dart';


@JsonSerializable(createFactory: false)
class CheckOtpParam {
  final String phone, otp;

  CheckOtpParam({required this.phone, required this.otp});

  Map<String, dynamic> toJson() => _$CheckOtpParamToJson(this);


}
