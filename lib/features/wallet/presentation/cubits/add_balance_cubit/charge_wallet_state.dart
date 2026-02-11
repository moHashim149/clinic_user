part of 'charge_wallet_cubit.dart';

@immutable
abstract class ChargeWalletState {}

class ChargeWalletInitial extends ChargeWalletState {}

class ChangePaymentMethod extends ChargeWalletState {}
class ChargeWalletLoading extends ChargeWalletState {}
class ChargeWalletFailure extends ChargeWalletState {}
class ChargeWalletSuccess extends ChargeWalletState {}

class PaymentsLoading extends ChargeWalletState {}
class PaymentsFailure extends ChargeWalletState {
  final String error;

  PaymentsFailure({required this.error});
}
class PaymentsSuccess extends ChargeWalletState {}
