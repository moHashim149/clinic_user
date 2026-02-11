import 'package:json_annotation/json_annotation.dart';

part 'update_cart_param.g.dart';

@JsonSerializable(createFactory: false)
class UpdateCartParam {
  @JsonKey(name: "product_id")
  final int productId;
  @JsonKey(name: "variant_id")
  final int? variantId;
  final int count;


  UpdateCartParam(
      {
        required this.productId,
        this.variantId,
        required this.count,
      });


  Map<String, dynamic> toJson() => _$UpdateCartParamToJson(this);



}
