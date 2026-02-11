import 'package:json_annotation/json_annotation.dart';

import '../../../women/data/models/store_model.dart';

part 'size_model.g.dart';

@JsonSerializable()
class SizeModel {
  final int id;
  final String name;

  const SizeModel({
    required this.id,
    required this.name,

  });

  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);
}
