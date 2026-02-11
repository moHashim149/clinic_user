part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
class OrdersLoading extends OrdersState {}
class OrdersPaginationLoading extends OrdersState {}
class OrdersFailure extends OrdersState {
  final String error;
  OrdersFailure(this.error);
}
class OrdersPaginationFailure extends OrdersState {}
class OrdersLoaded extends OrdersState {}
class ReOrderLoading extends OrdersState {}
class ReOrderFailure extends OrdersState {}
class ReOrderLoaded extends OrdersState {}



