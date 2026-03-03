// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationDetailsModel _$ReservationDetailsModelFromJson(
  Map<String, dynamic> json,
) => ReservationDetailsModel(
  id: (json['id'] as num).toInt(),
  offerNumber: json['offer_number'] as String,
  orderNumber: json['order_number'] as String,
  status: json['status'] as String,
  statusKey: (json['status_key'] as num).toInt(),
  isPrevious: json['is_previous'] as bool,
  date: json['date'] as String,
  time: json['time'] as String,
  clinicName: json['clinic_name'] as String,
  clinicRating: json['clinic_rating'] as num,
  locationDistrict: json['location_district'] as String,
  locationSubText: json['location_sub_text'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  sessionsCount: (json['sessions_count'] as num).toInt(),
  offerImage: json['offer_image'] as String,
  originalPrice: json['original_price'] as num,
  discount: json['discount'] as num,
  priceAfterDiscount: json['price_after_discount'] as num,
  vat: json['vat'] as num,
  total: json['total'] as num,
);
