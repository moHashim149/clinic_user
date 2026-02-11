import 'package:json_annotation/json_annotation.dart';

import '../../../women/data/models/store_model.dart';

part 'color_model.g.dart';

@JsonSerializable()
class ColorModel {
  final int id;
  final String name,hex;

  const ColorModel({
    required this.id,
    required this.name,
    required this.hex,

  });

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);
}
