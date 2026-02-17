import 'package:bloc/bloc.dart';
import 'package:brandy_user/features/addresses/data/repository/addresses_repository.dart';
import 'package:brandy_user/features/cart/data/params/remove_from_cart_param.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/app_cached.dart';
import '../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../addresses/data/models/address_model.dart';
import '../../data/models/cart_item_model.dart';
import '../../data/models/cart_model.dart';
import '../../data/models/coupon_model.dart';
import '../../data/params/check_coupon_param.dart';
import '../../data/params/update_cart_param.dart';
import '../../data/repository/cart_repository.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final CartRepository cartRepository;
  final SharedPrefServices appPrefs;
  final AddressesRepository addressesRepository;
  CartCubit(this.cartRepository, this.appPrefs, this.addressesRepository)
    : super(CartInitial());
  CartModel? cartModel;

  String? get token => appPrefs.getData(key: AppCached.token);

  List<AddressModel> addresses = [];

  Future<void> fetchAddresses() async {
    emit(CartLoading());
    final result = await addressesRepository.fetchAddresses();
    result.fold(
      (failure) {
        emit(CartFailure(failure.message));
      },
      (addresses) async {
        this.addresses = addresses;
        emit(CartLoaded());
      },
    );
  }

  Future<void> fetchCart() async {
    emit(CartLoading());
    final result = await cartRepository.fetchCart();
    result.fold(
      (l) {
        emit(CartFailure(l.message));
      },
      (cartModel) {
        this.cartModel = cartModel;
        fetchAddresses();
      },
    );
  }

  Future<void> updateCart(CartItemModel cartItemModel, bool isIncrement,VoidCallback? onUpdate) async {
    if (isIncrement) {
      cartItemModel.count = cartItemModel.count + 1;
      cartModel!.itemsTotal += cartItemModel.priceAfterDiscount == 0 ? cartItemModel.price : cartItemModel.priceAfterDiscount;
    } else {
      cartItemModel.count = cartItemModel.count - 1;
      cartModel!.itemsTotal -= cartItemModel.priceAfterDiscount == 0 ? cartItemModel.price : cartItemModel.priceAfterDiscount;
    }
    emit(UpdateCartLoading());
    final result = await cartRepository.updateCart(
      UpdateCartParam(productId: cartItemModel.product.id, count: cartItemModel.count,variantId: cartItemModel.variantId),
    );
    result.fold(
      (l) {
        showToast(text: l.message, state: ToastStates.error);
        emit(UpdateCartFailure());
      },
      (message) {
        if(onUpdate != null) {
          onUpdate();
        }
        emit(UpdateCartLoaded());
      },
    );
  }

  Future<void> deleteCart(
    CartItemModel cartItemModel,
    BuildContext context
  ,VoidCallback? onUpdate
  ) async {
    emit(DeleteCartLoading());
    final result = await cartRepository.removeFromCart(
      RemoveFromCartParam(id: cartItemModel.id),
    );
    result.fold(
      (l) {
        showToast(text: l.message, state: ToastStates.error);
        emit(DeleteCartFailure());
      },
      (message) {
        cartModel!.orderItems.remove(cartItemModel);
        cartModel!.itemsTotal = cartModel!.itemsTotal - 1;
        cartModel!.grandTotal = cartModel!.grandTotal - cartItemModel.total;
        if(onUpdate != null) {
          onUpdate();
        }
        emit(DeleteCartLoaded());
      },
    );
  }

  TextEditingController couponController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  CouponModel? couponModel;

  Future<void> checkCoupon() async {
    if (couponController.text.isEmpty) {
      return;
    }
    emit(CheckCouponLoading());
    var result = await cartRepository.checkCoupon(
      CheckCouponParam(
        code: couponController.text,
        total: cartModel!.itemsTotal.toString(),
      ),
    );
    result.fold(
      (error) {
        showToast(text: error.message, state: ToastStates.error);
        emit(CheckCouponFailure());
      },
      (couponModel) {
        this.couponModel = couponModel;
        emit(CheckCouponLoaded());
      },
    );
  }

  void clearCoupon() {
    couponController.clear();
    couponModel = null;
    emit(CheckCouponLoaded());
  }

  num? calculateDiscountValue(num subtotal) {
    if (couponModel == null) {
      return null;
    }

    return num.parse(couponModel!.discount.toDouble().toStringAsFixed(1));
  }

  num calculateTotal(num subtotal, num deliveryCost,num taxAmount) {
    return num.parse(
      (subtotal - (calculateDiscountValue(subtotal) ?? 0) + deliveryCost + taxAmount)
          .toDouble()
          .toStringAsFixed(1),
    );
  }

  @override
  Future<void> close() {
    // TODO: implement close
    couponController.dispose();
    notesController.dispose();
    return super.close();
  }
}
