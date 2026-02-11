import 'package:json_annotation/json_annotation.dart';

import '../../../auth/data/models/user_model.dart';

part 'message_model.g.dart';

@JsonSerializable(createToJson: false,includeIfNull: false)
class MessageModel {
  final int id;
  final String? message,image;
  @JsonKey(name: "view_type")
  final String viewType;
  @JsonKey(name: "created_at")
  final String createdAt;

  MessageModel({
    required this.id,
    this.message,
    this.image,
    required this.viewType,
    required this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

}
