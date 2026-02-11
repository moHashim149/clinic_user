import 'package:json_annotation/json_annotation.dart';

part 'section_products_param.g.dart';

@JsonSerializable(createFactory: false)
class SectionProductsParam {
  @JsonKey(includeToJson: false)
  final int storeId;
  @JsonKey(includeToJson: false)
  final int sectionId;
  final int page;

  SectionProductsParam({required this.storeId,required this.sectionId,required this.page});

  Map<String, dynamic> toJson() => _$SectionProductsParamToJson(this);
}
