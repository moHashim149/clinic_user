import 'package:json_annotation/json_annotation.dart';

part 'send_code_param.g.dart';

@JsonSerializable(createFactory: false)
class SendCodeParam {
  final String phone;
  final int type;

  SendCodeParam(
      {required this.phone, required this.type,});


  Map<String, dynamic> toJson() => _$SendCodeParamToJson(this);



}
