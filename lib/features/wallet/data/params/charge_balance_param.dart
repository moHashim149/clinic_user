import 'package:json_annotation/json_annotation.dart';

part 'charge_balance_param.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class ChargeBalanceParam {
  final String amount;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @JsonKey(name: 'payment_response')
  final dynamic paymentResponse;

  ChargeBalanceParam({
    required this.amount,
    required this.paymentMethod,
    this.paymentResponse,
  });

  Map<String, dynamic> toJson() => _$ChargeBalanceParamToJson(this);
}
