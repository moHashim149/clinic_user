import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  final int id;
  final String name,location,lat,lng;

  const AddressModel({required this.id, require, required this.location, required this.lat, required this.lng, required this.name});

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

}
