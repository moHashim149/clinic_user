// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  rating: json['rating'] as num?,
  ratingsCount: json['ratings_count'] as num?,
  logo: json['logo'] as String?,
  stories: (json['stories'] as List<dynamic>?)
      ?.map((e) => StoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  location: json['location'] as String?,
  cover: json['cover'] as String?,
  distance: json['distance'] as num?,
  isFav: json['is_favorite'] as bool?,
  workingHours: json['working_hours'] as String?,
  deliveryTime: json['delivery_time'] as String?,
  storeTypes: json['store_types'] as String?,
  deliveryCost: json['delivery_cost'] as String?,
);

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'ratings_count': instance.ratingsCount,
      'distance': instance.distance,
      'logo': instance.logo,
      'location': instance.location,
      'cover': instance.cover,
      'delivery_time': instance.deliveryTime,
      'working_hours': instance.workingHours,
      'delivery_cost': instance.deliveryCost,
      'stories': instance.stories,
      'is_favorite': instance.isFav,
      'store_types': instance.storeTypes,
    };
