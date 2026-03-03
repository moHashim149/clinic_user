import 'package:json_annotation/json_annotation.dart';

part 'reservation_model.g.dart';

@JsonSerializable(createToJson: false)
class ReservationModel {
  final int id;
  @JsonKey(name: "offer_number")
  final String offerNumber;
  @JsonKey(name: "order_number")
  final String orderNumber;
  final String status;
  @JsonKey(name: "status_key")
  final String statusKey;
  final num price;
  final String date;
  @JsonKey(name: "location_district")
  final String locationDistrict;
  @JsonKey(name: "location_sub_text")
  final String locationSubText;
  @JsonKey(name: "is_previous")
  final bool isPrevious;

  ReservationModel({
    required this.id,
    required this.offerNumber,
    required this.orderNumber,
    required this.status,
    required this.statusKey,
    required this.price,
    required this.date,
    required this.locationDistrict,
    required this.locationSubText,
    required this.isPrevious,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationModelFromJson(json);
}
