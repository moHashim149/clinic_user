import 'package:json_annotation/json_annotation.dart';

import '../../../auth/data/models/user_model.dart';

part 'message_model.g.dart';

@JsonSerializable(createToJson: false,includeIfNull: false)
class MessageModel {
  final int id;
  final UserModel sender,receiver;
  final String message,type,key;
  @JsonKey(name: "is_seen")
  final bool isSeen;
  @JsonKey(name: "created_at")
  final String createdAt;

  MessageModel({
    required this.id,
    required this.sender,
    required this.message,
    required this.type,
    required this.isSeen,
    required this.createdAt,
    required this.receiver,
    required this.key,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

}
