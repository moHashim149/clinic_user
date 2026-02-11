import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_message_param.g.dart';


@JsonSerializable(createFactory: false,includeIfNull: false)
class SendMessageParam {

  @JsonKey(name: "chat_id")
  final int chatId;
  final String? message;
  @JsonKey(toJson: _multipartFileToJson )
  final MultipartFile? file;

  SendMessageParam({required this.chatId, required this.file, this.message});

  static MultipartFile? _multipartFileToJson(MultipartFile? file) {
    return file;
  }

  Map<String, dynamic> toJson() => _$SendMessageParamToJson(this);


}
