import 'package:brandy_user/core/helpers/custom_location_helper.dart';
import 'package:brandy_user/features/women/data/params/home_param.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../core/constants/app_cached.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../favorites/data/params/fav_store_param.dart';
import '../../../favorites/data/repository/favorites_repository.dart';
import '../../data/models/home_model.dart';
import '../../data/models/store_model.dart';
import '../../data/repository/home_repository.dart';

part 'women_state.dart';

@injectable
class WomenCubit extends Cubit<WomenState> {
  final SharedPrefServices appPref;
  final HomeRepository homeRepository;
  final FavoritesRepository favoritesRepository;

  WomenCubit(this.appPref, this.homeRepository, this.favoritesRepository)
    : super(WomenInitial());

  int currentPage = 0;
  HomeModel? homeModel;
  UserModel? userModel;

  void changePageIndex(int index) {
    currentPage = index;
    emit(ChangePageIndexState());
  }

  String? get token => appPref.getData(key: AppCached.token);
  String currentLocation = "";
  double? lat, lng;

  Future<void> getCurrentPosition() async {
    emit(DataLoading());
    var position = await LocationHelper.getCurrentLocation();
    if (position != null) {
      lat = position.latitude;
      lng = position.longitude;
      Placemark placeMark = await LocationHelper.getLocationInfo(
        LatLng(lat!, lng!),
      );
      currentLocation =
          "${placeMark.name}, ${placeMark.subLocality}, ${placeMark.locality}, ${placeMark.administrativeArea}, ${placeMark.country}";
    }
  }

  Future<void> fetchHome(int storeType) async {
    await getCurrentPosition();
    var result = await homeRepository.fetchHome(
      HomeParam(storeType: storeType, lat: lat, lng: lng),
    );
    result.fold(
      (failure) {
        emit(DataFailure(error: failure.message));
      },
      (homeModel) {
        this.homeModel = homeModel;
        if (token != null) {
          fetchProfile();
        } else {
          emit(DataLoaded());
        }
      },
    );
  }

  Future<void> fetchProfile() async {
    emit(DataLoading());
    var result = await homeRepository.fetchProfile();
    result.fold(
      (failure) {
        emit(DataFailure(error: failure.message));
      },
      (profileModel) {
        userModel = profileModel;
        emit(DataLoaded());
      },
    );
  }

  void favStore(StoreModel storeModel) async {
    storeModel.isFav = !storeModel.isFav!;
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
