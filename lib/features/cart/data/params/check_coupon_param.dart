import 'package:json_annotation/json_annotation.dart';

part 'check_coupon_param.g.dart';

@JsonSerializable(createFactory: false)
class CheckCouponParam {
  final String code,total;

  CheckCouponParam({required this.code, required this.total});

  Map<String, dynamic> toJson() => _$CheckCouponParamToJson(this);
}
