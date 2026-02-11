part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}
final class ProductDetailsLoading extends ProductDetailsState {}
final class ProductDetailsLoaded extends ProductDetailsState {}
final class ProductDetailsFailure extends ProductDetailsState {
  final String error;

  ProductDetailsFailure({required this.error});
}

final class AvailableSizeLoading extends ProductDetailsState {}
final class AvailableSizeLoaded extends ProductDetailsState {}
final class AvailableSizeFailure extends ProductDetailsState {}

final class AddToCartLoading extends ProductDetailsState {}
final class AddToCartLoaded extends ProductDetailsState {}
final class AddToCartFailure extends ProductDetailsState {}
