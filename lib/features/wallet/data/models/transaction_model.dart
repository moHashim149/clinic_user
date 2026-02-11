import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable(createToJson: false)
class TransactionModel {
  final int id;
  final num amount;
  final String description, type;
  @JsonKey(name: "created_at")
  final String createdAt;

  TransactionModel({
    required this.amount,
    required this.description,
    required this.type,
    required this.id,
    required this.createdAt,

  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
