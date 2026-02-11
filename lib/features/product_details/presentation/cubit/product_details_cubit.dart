import 'package:bloc/bloc.dart';
import 'package:brandy_user/core/constants/app_cached.dart';
import 'package:brandy_user/core/local/shared_preferences/shared_pref_services.dart';
import 'package:brandy_user/core/widgets/custom_toast.dart';
import 'package:brandy_user/features/cart/data/repository/cart_repository.dart';
import 'package:brandy_user/features/product_details/data/models/product_model.dart';
import 'package:brandy_user/features/product_details/data/repository/product_details_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../cart/data/params/update_cart_param.dart';
import '../../data/models/available_size_model.dart';
import '../../data/params/available_size_param.dart';
import '../../data/params/product_details_param.dart';

part 'product_details_state.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductDetailsRepository productDetailsRepository;
  final CartRepository cartRepository;
  final SharedPrefServices appPrefs;
  ProductDetailsCubit(
    this.productDetailsRepository,
    this.cartRepository,
    this.appPrefs,
  ) : super(ProductDetailsInitial());

  ProductModel? productModel;
  int colorIndex = 0;
  int sizeIndex = 0;
  int quantity = 1;
  List<AvailableSizeModel> availableSizes = [];

  void incrementCount() {
    if (quantity < availableSizes[sizeIndex].variation.quantity) {
      quantity++;
      emit(ProductDetailsLoaded());
    }
  }

  void decrementCount() {
    if (quantity > 1) {
      quantity--;
    }
    emit(ProductDetailsLoaded());
  }

  String? get token => appPrefs.getData(key: AppCached.token);

  void changeColorIndex(int index) {
    if (colorIndex == index) return;
    colorIndex = index;
    availableSizes.clear();
    sizeIndex = 0;
    fetchAvailableSize();
  }

  void changeSizeIndex(int index) {
    if (sizeIndex == index) return;
    sizeIndex = index;
    emit(ProductDetailsLoaded());
  }

  Future<void> fetchProductDetails(int productId) async {
    emit(ProductDetailsLoading());
    var result = await productDetailsRepository.fetchProductDetails(
      ProductDetailsParam(productId: productId),
    );
    result.fold(
      (failure) {
        emit(ProductDetailsFailure(error: failure.message));
      },
      (productModel) {
        this.productModel = productModel;
        fetchAvailableSize();
      },
    );
  }

  Future<void> fetchAvailableSize() async {
    emit(AvailableSizeLoading());
    var result = await productDetailsRepository.fetchAvailableSize(
      AvailableSizeParam(
        productId: productModel!.id,
        colorId: productModel!.colors![colorIndex].id,
      ),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(AvailableSizeFailure());
      },
      (availableSizes) {
        this.availableSizes = availableSizes;
        emit(AvailableSizeLoaded());
      },
    );
  }

  Future<void> addToCart(Function onUpdate) async {
    emit(AddToCartLoading());
    var result = await cartRepository.updateCart(
      UpdateCartParam(
        productId: productModel!.id,
        variantId: availableSizes[sizeIndex].variation.id,
        count: quantity,
      ),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(AddToCartFailure());
      },
      (message) {
        showToast(text: message, state: ToastStates.success);
        onUpdate();
        emit(AddToCartLoaded());
      },
    );
  }
}
