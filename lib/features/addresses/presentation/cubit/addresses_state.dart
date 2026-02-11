part of 'addresses_cubit.dart';

@immutable
sealed class AddressesState {}

final class AddressesInitial extends AddressesState {}
final class AddressesLoading extends AddressesState {}
final class AddressesLoaded extends AddressesState {}
final class AddressesFailure extends AddressesState {
  final String error;

  AddressesFailure({required this.error});
}

