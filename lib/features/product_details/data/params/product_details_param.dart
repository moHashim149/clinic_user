import 'package:json_annotation/json_annotation.dart';

part 'product_details_param.g.dart';

@JsonSerializable(createFactory: false)
class ProductDetailsParam {
  final int productId;

  ProductDetailsParam({required this.productId});

  Map<String, dynamic> toJson() => _$ProductDetailsParamToJson(this);
}
