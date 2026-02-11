import 'package:json_annotation/json_annotation.dart';

part 'orders_param.g.dart';

@JsonSerializable(createFactory: false,includeIfNull: false)
class OrdersParam {
  final int? status;
  final int page;

  OrdersParam({this.status,required this.page});

  Map<String, dynamic> toJson() => _$OrdersParamToJson(this);
}
