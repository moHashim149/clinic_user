import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_message_param.g.dart';


@JsonSerializable(createFactory: false,includeIfNull: false)
class SendMessageParam {
  @JsonKey(name: "receiver_id")
  final int receiverId;
  @JsonKey(name: "product_id")
  final int productid;
  final String? message;
  @JsonKey(name: "img",toJson: _multipartFileToJson )
  final MultipartFile? image;

  SendMessageParam({required this.receiverId, required this.productid, this.message,  this.image});

  static MultipartFile? _multipartFileToJson(MultipartFile? file) {
    return file;
  }

  Map<String, dynamic> toJson() => _$SendMessageParamToJson(this);


}
