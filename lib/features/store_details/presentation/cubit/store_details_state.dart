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

final class SectionProductsLoading extends StoreDetailsState {}

final class SectionProductsLoaded extends StoreDetailsState {}

final class SectionProductsFailure extends StoreDetailsState {
  final String message;
  SectionProductsFailure(this.message);
}

class SectionProductsPaginationLoading extends StoreDetailsState {}

class SectionProductsPaginationFailure extends StoreDetailsState {}

final class FavLoading extends StoreDetailsState {}

final class FavLoaded extends StoreDetailsState {}

final class FavFailure extends StoreDetailsState {}


final class CartLoading extends StoreDetailsState {}

final class CartLoaded extends StoreDetailsState {}

final class CartFailure extends StoreDetailsState {}

final class AddToCartLoading extends StoreDetailsState {}

final class AddToCartLoaded extends StoreDetailsState {}

final class AddToCartFailure extends StoreDetailsState {}
