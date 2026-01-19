import 'package:json_annotation/json_annotation.dart';

import 'pagination_model.dart';

part 'pagination_data_model.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class PaginationDataModel<T> {
  @JsonKey(name: 'data')
  final List<T> list;

  final PaginationModel pagination;

  PaginationDataModel({required this.list, required this.pagination});

  factory PaginationDataModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginationDataModelFromJson(json, fromJsonT);
}
