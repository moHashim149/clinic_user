// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
  id: (json['id'] as num).toInt(),
  message: json['message'] as String?,
  image: json['image'] as String?,
  viewType: json['view_type'] as String,
  createdAt: json['created_at'] as String,
);
