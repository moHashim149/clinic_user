// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreDetailsModel _$StoreDetailsModelFromJson(Map<String, dynamic> json) =>
    StoreDetailsModel(
      store: StoreModel.fromJson(json['store'] as Map<String, dynamic>),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreDetailsModelToJson(StoreDetailsModel instance) =>
    <String, dynamic>{'store': instance.store, 'sections': instance.sections};
