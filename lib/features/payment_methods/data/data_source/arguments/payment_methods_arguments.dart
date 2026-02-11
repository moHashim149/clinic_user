class PaymentMethodsArguments {
  final int locationId;
  final num total;
  final String? couponCode;

  PaymentMethodsArguments({
    required this.locationId,
    required this.total,
    this.couponCode,
  });
}