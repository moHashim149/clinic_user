// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
  storeStories: (json['stories_stores'] as List<dynamic>)
      .map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  featuredStores: (json['featured_stores'] as List<dynamic>)
      .map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  nearbyStores: (json['nearby_stores'] as List<dynamic>)
      .map((e) => StoreModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  banners: (json['banners'] as List<dynamic>)
      .map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
  'stories_stores': instance.storeStories,
  'featured_stores': instance.featuredStores,
  'nearby_stores': instance.nearbyStores,
  'banners': instance.banners,
  'categories': instance.categories,
};
