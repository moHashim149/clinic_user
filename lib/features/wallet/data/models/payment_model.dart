
import 'package:equatable/equatable.dart';

class PaymentModel extends Equatable{
  final String name;
  final String? subtitle, walletBalance;
  final List<String> icons;

  const PaymentModel({
    required this.name,
    this.subtitle,
    this.walletBalance,
    required this.icons,
  });

  @override
  List<Object?> get props => [
    name,
    subtitle,
    walletBalance,
    icons,
  ];
}
