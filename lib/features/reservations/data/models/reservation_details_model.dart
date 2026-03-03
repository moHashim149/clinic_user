import 'package:json_annotation/json_annotation.dart';

part 'reservation_details_model.g.dart';

@JsonSerializable(createToJson: false)
class ReservationDetailsModel {
  final int id;
  @JsonKey(name: "offer_number")
  final String offerNumber;
  @JsonKey(name: "order_number")
  final String orderNumber;
  final String status;
  @JsonKey(name: "status_key")
  final int statusKey;
  @JsonKey(name: "is_previous")
  final bool isPrevious;
  final String date;
  final String time;

  // Clinic info
  @JsonKey(name: "clinic_name")
  final String clinicName;
  @JsonKey(name: "clinic_rating")
  final num clinicRating;
  @JsonKey(name: "location_district")
  final String locationDistrict;
  @JsonKey(name: "location_sub_text")
  final String locationSubText;
  @JsonKey(name: "latitude")
  final double latitude;
  @JsonKey(name: "longitude")
  final double longitude;

  // Offer extra details
  @JsonKey(name: "sessions_count")
  final int sessionsCount;
  @JsonKey(name: "offer_image")
  final String offerImage;

  // Pricing
  @JsonKey(name: "original_price")
  final num originalPrice;
  final num discount;
  @JsonKey(name: "price_after_discount")
  final num priceAfterDiscount;
  final num vat;
  final num total;

  ReservationDetailsModel({
    required this.id,
    required this.offerNumber,
    required this.orderNumber,
    required this.status,
    required this.statusKey,
    required this.isPrevious,
    required this.date,
    required this.time,
    required this.clinicName,
    required this.clinicRating,
    required this.locationDistrict,
    required this.locationSubText,
    required this.latitude,
    required this.longitude,
    required this.sessionsCount,
    required this.offerImage,
    required this.originalPrice,
    required this.discount,
    required this.priceAfterDiscount,
    required this.vat,
    required this.total,
  });

  factory ReservationDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationDetailsModelFromJson(json);
}
