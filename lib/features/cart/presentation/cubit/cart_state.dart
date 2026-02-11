part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}
class CartFailure extends CartState {
  final String error;
  CartFailure(this.error);
}
class CartLoaded extends CartState {}

class AddToCartLoading extends CartState {}
class AddToCartLoaded extends CartState {}
class AddToCartFailure extends CartState {}

class UpdateCartLoading extends CartState {}
class UpdateCartLoaded extends CartState {}
class UpdateCartFailure extends CartState {}

class DeleteCartLoading extends CartState {}
class DeleteCartLoaded extends CartState {}
class DeleteCartFailure extends CartState {}

class CheckCouponLoading extends CartState {}
class CheckCouponLoaded extends CartState {}
class CheckCouponFailure extends CartState {}
