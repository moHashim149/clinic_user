part of 'wallet_cubit.dart';

@immutable
abstract class WalletState {}

class WalletInitial extends WalletState {}

class GetWalletLoading extends WalletState {}

class GetWalletFailure extends WalletState {
  final String error;

  GetWalletFailure({required this.error});
}

class GetWalletSuccess extends WalletState {}
