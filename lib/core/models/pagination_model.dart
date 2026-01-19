import 'package:json_annotation/json_annotation.dart';

part 'pagination_model.g.dart';

@JsonSerializable(createToJson: false, includeIfNull: true)
class PaginationModel {
  @JsonKey(name: "last_page")
  final int lastPage;
  @JsonKey(name: "current_page")
  final int currentPage;
  @JsonKey(name: "per_page")
  final int perPage;
  final int? from, to;
  final int total;
  @JsonKey(name: "has_more_pages")
  final bool hasMorePages;

  PaginationModel({
    required this.lastPage,
    required this.currentPage,
    required this.perPage,
    this.from,
    this.to,
    required this.total,
    required this.hasMorePages,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}
