part of 'payment_methods_cubit.dart';

@immutable
abstract class PaymentMethodsState {}

class PaymentMethodsInitial extends PaymentMethodsState {}

class ChangePaymentMethod extends PaymentMethodsState {}
class PlaceOrderLoading extends PaymentMethodsState {}
class PlaceOrderFailure extends PaymentMethodsState {}
class PlaceOrderSuccess extends PaymentMethodsState {}

class PaymentsLoading extends PaymentMethodsState {}
class PaymentsFailure extends PaymentMethodsState {
  final String error;

  PaymentsFailure({required this.error});
}
class PaymentsSuccess extends PaymentMethodsState {}
