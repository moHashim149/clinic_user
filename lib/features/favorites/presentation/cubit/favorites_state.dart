part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}
final class FavoritesLoading extends FavoritesState {}
final class FavoritesLoaded extends FavoritesState {}
final class FavoritesFailure extends FavoritesState {
  final String error;

  FavoritesFailure({required this.error});
}

class FavoritesPaginationLoading extends FavoritesState {}

class FavoritesPaginationFailure extends FavoritesState {}

class FavLoading extends FavoritesState {}
class FavLoaded extends FavoritesState {}
class FavFailure extends FavoritesState {}
