part of 'store_details_cubit.dart';

@immutable
sealed class StoreDetailsState {}

final class StoreDetailsInitial extends StoreDetailsState {}
final class StoreDetailsLoading extends StoreDetailsState {}
final class StoreDetailsLoaded extends StoreDetailsState {}
final class StoreDetailsFailure extends StoreDetailsState {
  final String error;

  StoreDetailsFailure({required this.error});
}
