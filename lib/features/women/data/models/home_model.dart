
import 'package:json_annotation/json_annotation.dart';

import 'banner_model.dart';
import 'category_model.dart';
import 'store_model.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  @JsonKey(name: "stories_stores")
  final List<StoreModel> storeStories;
  @JsonKey(name: "featured_stores")
  final List<StoreModel> featuredStores;
  @JsonKey(name: "nearby_stores")
  final List<StoreModel> nearbyStores;
  final List<BannerModel> banners;
  final List<CategoryModel> categories;

  const HomeModel({
    required this.storeStories,
    required this.featuredStores,
    required this.nearbyStores,
    required this.banners,
    required this.categories,
});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}
