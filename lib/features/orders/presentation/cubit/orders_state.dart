part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
final class OrdersLoading extends OrdersState {}
final class OrdersLoaded extends OrdersState {}
final class OrdersFailure extends OrdersState {
  final String error;

  OrdersFailure({required this.error});
}
