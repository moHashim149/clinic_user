import 'package:bloc/bloc.dart';
import 'package:brandy_user/features/favorites/data/repository/favorites_repository.dart';
import 'package:brandy_user/features/women/data/models/store_model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/widgets/custom_toast.dart';
import '../../data/params/fav_store_param.dart';

part 'favorites_state.dart';
@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepository favoritesRepository;
  FavoritesCubit(this.favoritesRepository) : super(FavoritesInitial());

  List<StoreModel> favStores = [];

  Future<void> fetchFavorites() async {
      emit(FavoritesLoading());
    final result = await favoritesRepository.fetchFavStores();
    result.fold(
          (failure) {
          emit(FavoritesFailure(error: failure.message));
      },
          (stores) async {
        favStores = stores;
        emit(FavoritesLoaded());
      },
    );
  }


  void favStore(StoreModel storeModel) async {
    favStores.removeWhere((element) => element.id == storeModel.id);
    emit(FavLoading());
    var result = await favoritesRepository.toggleFav(
      FavStoreParam(storeId: storeModel.id),
    );
    result.fold(
          (error) {
        showToast(text: error.message, state: ToastStates.error);
        emit(FavFailure());
      },
          (r) {
        emit(FavLoaded());
      },
    );
  }

}
