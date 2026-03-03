import 'package:json_annotation/json_annotation.dart';

part 'offer_cart_item_model.g.dart';

@JsonSerializable(createToJson: false)
class OfferCartItemModel {
  final int id;
  @JsonKey(name: "offer_number")
  final String offerNumber;
  @JsonKey(name: "booking_date")
  final String bookingDate; // e.g., "02 يناير 2026 ، 09:00م"
  final String district; // e.g., "حي السويدي"
  @JsonKey(name: "location_sub_text")
  final String locationSubText; // e.g., "مجمع الرياض امام مسجد الفرج"
  final String image;
  final num price;

  OfferCartItemModel({
    required this.id,
    required this.offerNumber,
    required this.bookingDate,
    required this.district,
    required this.locationSubText,
    required this.image,
    required this.price,
  });

  factory OfferCartItemModel.fromJson(Map<String, dynamic> json) =>
      _$OfferCartItemModelFromJson(json);
}
