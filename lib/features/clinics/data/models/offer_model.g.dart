// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => OfferModel(
  id: (json['id'] as num).toInt(),
  offerNumber: json['offer_number'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  price: json['price'] as num,
  oldPrice: json['old_price'] as num,
  category: json['category'] as String,
  tag: json['tag'] as String,
  cashbackPoints: (json['cashback_points'] as num).toInt(),
  clinicName: json['clinic_name'] as String,
  clinicLogo: json['clinic_logo'] as String,
  rating: (json['rating'] as num).toDouble(),
  ratingCount: (json['rating_count'] as num).toInt(),
  locationDistrict: json['location_district'] as String,
  locationSubText: json['location_sub_text'] as String,
  deviceUsed: json['device_used'] as String,
  sessionsCount: json['sessions_count'] as String,
  headerImage: json['header_image'] as String,
);
