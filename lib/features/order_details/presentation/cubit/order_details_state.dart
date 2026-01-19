part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}
final class OrderDetailsLoading extends OrderDetailsState {}
final class OrderDetailsLoaded extends OrderDetailsState {}
final class OrderDetailsFailure extends OrderDetailsState {
  final String error;

  OrderDetailsFailure({required this.error});
}
