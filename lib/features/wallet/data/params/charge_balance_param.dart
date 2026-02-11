import 'package:json_annotation/json_annotation.dart';

part 'charge_balance_param.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class ChargeBalanceParam {
  final String amount;

  ChargeBalanceParam({
    required this.amount,
  });

  Map<String, dynamic> toJson() => _$ChargeBalanceParamToJson(this);
}
