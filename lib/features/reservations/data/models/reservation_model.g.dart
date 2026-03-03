// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      id: (json['id'] as num).toInt(),
      offerNumber: json['offer_number'] as String,
      orderNumber: json['order_number'] as String,
      status: json['status'] as String,
      statusKey: json['status_key'] as String,
      price: json['price'] as num,
      date: json['date'] as String,
      locationDistrict: json['location_district'] as String,
      locationSubText: json['location_sub_text'] as String,
      isPrevious: json['is_previous'] as bool,
    );
