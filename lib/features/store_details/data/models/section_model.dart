import 'package:json_annotation/json_annotation.dart';

import '../../../women/data/models/store_model.dart';

part 'section_model.g.dart';

@JsonSerializable()
class SectionModel {
  final int id;
  final String name;

  const SectionModel({required this.id, required this.name});

  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);
}
