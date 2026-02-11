import 'package:json_annotation/json_annotation.dart';

import 'transaction_model.dart';

part 'payment_model.g.dart';

@JsonSerializable(createToJson: false)
class PaymentModel {
  final int id;
  final String name,image;

  PaymentModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}
