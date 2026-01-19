// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationDataModel<T> _$PaginationDataModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginationDataModel<T>(
  list: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  pagination: PaginationModel.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);
