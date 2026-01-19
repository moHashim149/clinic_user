import 'package:json_annotation/json_annotation.dart';

import 'city_model.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: true)
class UserModel {
  final int id;
  @JsonKey(name: 'f_name')
  final String? firstName;
  @JsonKey(name: 'l_name')
  final String? lastName;
  final String? name;
  final String? whatsapp,phone;
  @JsonKey(name: 'img')
  final String image;
  final CityModel? city;
  @JsonKey(name: 'is_notify')
  final bool? isNotify;
  @JsonKey(name: 'is_message')
  final bool? isMessage;
  final String? location;



  UserModel({
    required this.id,
    this.firstName,
    this.lastName,
    this.name,
     this.phone,
     this.whatsapp,
     this.location,
    required this.image,
    this.isNotify,
     this.city,
    this.isMessage,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
