import 'package:json_annotation/json_annotation.dart';

part 'offer_model.g.dart';

@JsonSerializable(createToJson: false)
class OfferModel {
  final int id;
  @JsonKey(name: "offer_number")
  final String offerNumber;
  final String title;
  final String description;
  final num price;
  @JsonKey(name: "old_price")
  final num oldPrice;
  final String category;
  final String tag;
  @JsonKey(name: "cashback_points")
  final int cashbackPoints;
  @JsonKey(name: "clinic_name")
  final String clinicName;
  @JsonKey(name: "clinic_logo")
  final String clinicLogo;
  final double rating;
  @JsonKey(name: "rating_count")
  final int ratingCount;
  @JsonKey(name: "location_district")
  final String locationDistrict;
  @JsonKey(name: "location_sub_text")
  final String locationSubText;
  @JsonKey(name: "device_used")
  final String deviceUsed;
  @JsonKey(name: "sessions_count")
  final String sessionsCount;
  @JsonKey(name: "header_image")
  final String headerImage;

  OfferModel({
    required this.id,
    required this.offerNumber,
    required this.title,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.category,
    required this.tag,
    required this.cashbackPoints,
    required this.clinicName,
    required this.clinicLogo,
    required this.rating,
    required this.ratingCount,
    required this.locationDistrict,
    required this.locationSubText,
    required this.deviceUsed,
    required this.sessionsCount,
    required this.headerImage,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}
