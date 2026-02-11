import 'package:json_annotation/json_annotation.dart';

import 'city_model.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: true)
class UserModel {
  final int id;
  final String name;
  final String? email,phone;
  final String image;
  final CityModel? city;



  UserModel({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.city,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
