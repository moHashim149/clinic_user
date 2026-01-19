
import 'package:json_annotation/json_annotation.dart';

import '../../../auth/data/models/user_model.dart';

part 'room_model.g.dart';

@JsonSerializable(createToJson: false,includeIfNull: false)
class RoomModel {
  final int id,count;
  final UserModel sender;
  final String message,type;
  @JsonKey(name: "is_seen")
  final bool isSeen;
  @JsonKey(name: "last_message_time")
  final String lastMessageTime;
  @JsonKey(name: "product_id")
  final int productId;

  RoomModel({
    required this.id,
    required this.count,
    required this.sender,
    required this.message,
    required this.type,
    required this.isSeen,
    required this.productId,
    required this.lastMessageTime,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

}
