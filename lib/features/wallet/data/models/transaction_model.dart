import 'package:json_annotation/json_annotation.dart';

part 'transaction_model.g.dart';

@JsonSerializable(createToJson: false)
class TransactionModel {
  final num amount;
  final String title , date, description, type, image;

  TransactionModel({
    required this.amount,
    required this.title,
    required this.date,
    required this.description,
    required this.type,
    required this.image,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
