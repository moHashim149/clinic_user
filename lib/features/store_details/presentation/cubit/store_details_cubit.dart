import 'package:bloc/bloc.dart';
import 'package:brandy_user/core/constants/app_cached.dart';
import 'package:brandy_user/core/helpers/custom_location_helper.dart';
import 'package:brandy_user/core/local/shared_preferences/shared_pref_services.dart';
import 'package:brandy_user/features/cart/data/models/cart_model.dart';
import 'package:brandy_user/features/cart/data/repository/cart_repository.dart';
import 'package:brandy_user/features/favorites/data/repository/favorites_repository.dart';
import 'package:brandy_user/features/product_details/data/models/product_model.dart';
import 'package:brandy_user/features/store_details/data/repository/store_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/models/pagination_data_model.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../cart/data/params/remove_from_cart_param.dart';
import '../../../cart/data/params/update_cart_param.dart';
import '../../../favorites/data/params/fav_store_param.dart';
import '../../data/models/store_details_model.dart';
import '../../data/params/section_products_param.dart';
import '../../data/params/store_details_param.dart';

part 'store_details_state.dart';

@injectable
class StoreDetailsCubit extends Cubit<StoreDetailsState> {
  final StoreDetailsRepository storeDetailsRepository;
  final SharedPrefServices appPrefs;
  final CartRepository cartRepository;
  final FavoritesRepository favoritesRepository;
  StoreDetailsCubit(
    this.storeDetailsRepository,
    this.appPrefs,
    this.cartRepository,
    this.favoritesRepository,
  ) : super(StoreDetailsInitial());

  StoreDetailsModel? storeDetailsModel;

  int currentSectionIndex = 0;
  int page = 1;
  RefreshController refreshController = RefreshController();
  List<ProductModel> products = [];
  PaginationDataModel<ProductModel>? paginationDataModel;
  CartModel? cartModel;

  void changeSectionIndex(int index) {
    if (currentSectionIndex == index) return;
    currentSectionIndex = index;
    fetchSectionProducts();
  }

  String? get token => appPrefs.getData(key: AppCached.token);

  Future<void> fetchStoreDetails(int storeId) async {
    emit(StoreDetailsLoading());
    var position = await LocationHelper.getCurrentLocation();
    var result = await storeDetailsRepository.fetchStoreDetails(
      StoreDetailsParam(
        storeId: storeId,
        lat: position?.latitude,
        lng: position?.longitude,
      ),
    );
    result.fold(
      (failure) {
        emit(StoreDetailsFailure(error: failure.message));
      },
      (storeDetailsModel) {
        this.storeDetailsModel = storeDetailsModel;
        fetchSectionProducts();
      },
    );
  }

  Future<void> fetchCart() async {
    emit(CartLoading());
    var result = await cartRepository.fetchCart();
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(CartFailure());
      },
      (cartModel) {
        this.cartModel = cartModel;
        emit(CartLoaded());
      },
    );
  }

  Future<void> fetchSectionProducts() async {
    if (page != 1) {
      emit(SectionProductsPaginationLoading());
    } else {
      emit(SectionProductsLoading());
    }
    final result = await storeDetailsRepository.fetchSectionProducts(
      SectionProductsParam(
        page: page,
        sectionId: storeDetailsModel!.sections[currentSectionIndex].id,
        storeId: storeDetailsModel!.store.id,
      ),
    );
    result.fold(
      (failure) {
        if (page != 1) {
          refreshController.loadFailed();
          showToast(text: failure.message, state: ToastStates.error);
          emit(SectionProductsPaginationFailure());
        } else {
          emit(SectionProductsFailure(failure.message));
        }
      },
      (paginationDataModel) async {
        this.paginationDataModel = paginationDataModel;
        if (page != 1) {
          products.addAll(paginationDataModel.list);
          refreshController.loadComplete();
          emit(SectionProductsLoaded());
        } else {
          refreshController.refreshCompleted();
          refreshController.loadComplete();
          products.clear();
          products.addAll(paginationDataModel.list);
          if(token != null) {
            fetchCart();
          }else{
            emit(SectionProductsLoaded());
          }
        }
      },
    );
  }

  void refreshSectionProducts() {
    page = 1;
    fetchSectionProducts();
  }

  void paginateSectionProducts() {
    if (state is! SectionProductsPaginationFailure) {
      if (paginationDataModel!.pagination.currentPage <
          paginationDataModel!.pagination.lastPage) {
        page++;
        fetchSectionProducts();
      } else {
        refreshController.loadNoData();
      }
    } else {
      fetchSectionProducts();
    }
  }

  void favStore() async {
    storeDetailsModel!.store.isFav = !storeDetailsModel!.store.isFav!;
    emit(FavLoading());
    var result = await favoritesRepository.toggleFav(
      FavStoreParam(storeId: storeDetailsModel!.store.id),
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


  @override
  Future<void> close() {
    refreshController.dispose();
    return super.close();
  }
}
