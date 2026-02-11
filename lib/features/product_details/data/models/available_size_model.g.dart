// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_size_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableSizeModel _$AvailableSizeModelFromJson(Map<String, dynamic> json) =>
    AvailableSizeModel(
      sizeId: (json['size_id'] as num).toInt(),
      sizeName: json['size_name'] as String,
      variation: VariationModel.fromJson(
        json['variation'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$AvailableSizeModelToJson(AvailableSizeModel instance) =>
    <String, dynamic>{
      'size_id': instance.sizeId,
      'size_name': instance.sizeName,
      'variation': instance.variation,
    };
