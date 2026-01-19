// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
  id: (json['id'] as num).toInt(),
  sender: UserModel.fromJson(json['sender'] as Map<String, dynamic>),
  message: json['message'] as String,
  type: json['type'] as String,
  isSeen: json['is_seen'] as bool,
  createdAt: json['created_at'] as String,
  receiver: UserModel.fromJson(json['receiver'] as Map<String, dynamic>),
  key: json['key'] as String,
);
