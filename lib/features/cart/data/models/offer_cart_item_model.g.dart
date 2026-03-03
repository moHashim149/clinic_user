// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferCartItemModel _$OfferCartItemModelFromJson(Map<String, dynamic> json) =>
    OfferCartItemModel(
      id: (json['id'] as num).toInt(),
      offerNumber: json['offer_number'] as String,
      bookingDate: json['booking_date'] as String,
      district: json['district'] as String,
      locationSubText: json['location_sub_text'] as String,
      image: json['image'] as String,
      price: json['price'] as num,
    );
