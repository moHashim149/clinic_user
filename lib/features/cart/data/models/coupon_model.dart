import 'package:json_annotation/json_annotation.dart';

part 'coupon_model.g.dart';

@JsonSerializable(createToJson: false)
class CouponModel  {
  num discount;

  CouponModel({required this.discount});

  factory CouponModel.fromJson(Map<String, dynamic> json) =>
      _$CouponModelFromJson(json);

}
