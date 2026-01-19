// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
  id: (json['id'] as num).toInt(),
  count: (json['count'] as num).toInt(),
  sender: UserModel.fromJson(json['sender'] as Map<String, dynamic>),
  message: json['message'] as String,
  type: json['type'] as String,
  isSeen: json['is_seen'] as bool,
  productId: (json['product_id'] as num).toInt(),
  lastMessageTime: json['last_message_time'] as String,
);
