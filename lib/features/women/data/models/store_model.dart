import 'package:brandy_user/features/women/data/models/story_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  final int id;
  final String name;
  final num? rating;
  @JsonKey(name: "ratings_count")
  final num? ratingsCount;
  final num? distance;
  final String? logo,location,cover;
  @JsonKey(name: "delivery_time")
  final String? deliveryTime;
  @JsonKey(name: "working_hours")
  final String? workingHours;
  @JsonKey(name: "delivery_cost")
  final String? deliveryCost;
  final List<StoryModel>? stories;
  @JsonKey(name: "is_favorite")
  bool? isFav;
  @JsonKey(name: "store_types")
  final String? storeTypes;

   StoreModel({
    required this.id,
    required this.name,
    this.rating,
    this.ratingsCount,
    this.logo,
    required this.stories,
    this.location,
    this.cover,
    this.distance,
    this.isFav,
    this.workingHours,
    this.deliveryTime,
    this.storeTypes,
    this.deliveryCost,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}
