import 'package:brandy_user/features/store_details/data/models/section_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../women/data/models/store_model.dart';

part 'store_details_model.g.dart';

@JsonSerializable()
class StoreDetailsModel {
  final StoreModel store;
  final List<SectionModel> sections;

  const StoreDetailsModel({required this.store, required this.sections});

  factory StoreDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailsModelFromJson(json);
}
