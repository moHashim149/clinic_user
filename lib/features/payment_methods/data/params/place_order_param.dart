import 'package:json_annotation/json_annotation.dart';

part 'place_order_param.g.dart';

@JsonSerializable(createFactory: false)
class PlaceOrderParam {
  @JsonKey(name: 'location_id')
  final int locationId;
  @JsonKey(name: 'payment_method')
  final int paymentMethod;
  @JsonKey(name: 'coupon_code')
  final String? couponCode;

  PlaceOrderParam({
    required this.locationId,
    required this.paymentMethod,
    this.couponCode,
  });

  Map<String, dynamic> toJson() => _$PlaceOrderParamToJson(this);
}
