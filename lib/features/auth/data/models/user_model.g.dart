// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num).toInt(),
  firstName: json['f_name'] as String?,
  lastName: json['l_name'] as String?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  whatsapp: json['whatsapp'] as String?,
  location: json['location'] as String?,
  image: json['img'] as String,
  isNotify: json['is_notify'] as bool?,
  city: json['city'] == null
      ? null
      : CityModel.fromJson(json['city'] as Map<String, dynamic>),
  isMessage: json['is_message'] as bool?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'f_name': instance.firstName,
  'l_name': instance.lastName,
  'name': instance.name,
  'whatsapp': instance.whatsapp,
  'phone': instance.phone,
  'img': instance.image,
  'city': instance.city,
  'is_notify': instance.isNotify,
  'is_message': instance.isMessage,
  'location': instance.location,
};
