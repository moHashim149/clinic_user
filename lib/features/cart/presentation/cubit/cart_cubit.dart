import 'package:bloc/bloc.dart';
import 'package:brandy_user/features/addresses/data/repository/addresses_repository.dart';
import 'package:brandy_user/features/cart/data/models/offer_cart_item_model.dart';
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
  List<OfferCartItemModel> offerItems = [];

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
        // user requested mock data instead of failure for testing the UI
        offerItems = [
          OfferCartItemModel(
            id: 1,
            offerNumber: "45896",
            bookingDate: "02 يناير 2026 ، 09:00م",
            district: "حي السويدي",
            locationSubText: "مجمع الرياض امام مسجد الفرج",
            image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmrDDrc-6BUaso8th2bVUxJI8rpvTVa-Zpbg&s",
            price: 500.70,
          ),
          OfferCartItemModel(
            id: 2,
            offerNumber: "45897",
            bookingDate: "05 يناير 2026 ، 10:30ص",
            district: "حي المروج",
            locationSubText: "برج المملكة، الدور الثالث",
            image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmrDDrc-6BUaso8th2bVUxJI8rpvTVa-Zpbg&s",
            price: 750.00,
          ),
        ];
        emit(CartLoaded());
      },
      (cartModel) {
        this.cartModel = cartModel;
        // Mocking mapping to OfferCartItemModel for the new design
        offerItems = cartModel.orderItems
            .map(
              (item) => OfferCartItemModel(
                id: item.id,
                offerNumber: "4589${item.id}", // Mocked
                bookingDate: "02 يناير 2026 ، 09:00م", // Mocked
                district: "حي السويدي", // Mocked
                locationSubText: "مجمع الرياض امام مسجد الفرج", // Mocked
                image:
                    item.product.image ??
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmrDDrc-6BUaso8th2bVUxJI8rpvTVa-Zpbg&s",
                price: item.priceAfterDiscount != 0
                    ? item.priceAfterDiscount
                    : item.price,
              ),
            )
            .toList();

        // Ensure some data for demo if empty
        if (offerItems.isEmpty) {
          offerItems = [
            OfferCartItemModel(
              id: 1,
              offerNumber: "45896",
              bookingDate: "02 يناير 2026 ، 09:00م",
              district: "حي السويدي",
              locationSubText: "مجمع الرياض امام مسجد الفرج",
              image:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmrDDrc-6BUaso8th2bVUxJI8rpvTVa-Zpbg&s",
              price: 500.70,
            ),
            OfferCartItemModel(
              id: 2,
              offerNumber: "45897",
              bookingDate: "05 يناير 2026 ، 10:30ص",
              district: "حي المروج",
              locationSubText: "برج المملكة، الدور الثالث",
              image:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmrDDrc-6BUaso8th2bVUxJI8rpvTVa-Zpbg&s",
              price: 750.00,
            ),
          ];
        }

        fetchAddresses();
      },
    );
  }

  Future<void> updateCart(
    CartItemModel cartItemModel,
    bool isIncrement,
    VoidCallback? onUpdate,
  ) async {
    if (isIncrement) {
      cartItemModel.count = cartItemModel.count + 1;
      cartModel!.itemsTotal += cartItemModel.priceAfterDiscount == 0
          ? cartItemModel.price
          : cartItemModel.priceAfterDiscount;
    } else {
      cartItemModel.count = cartItemModel.count - 1;
      cartModel!.itemsTotal -= cartItemModel.priceAfterDiscount == 0
          ? cartItemModel.price
          : cartItemModel.priceAfterDiscount;
    }
    emit(UpdateCartLoading());
    final result = await cartRepository.updateCart(
      UpdateCartParam(
        productId: cartItemModel.product.id,
        count: cartItemModel.count,
        variantId: cartItemModel.variantId,
      ),
    );
    result.fold(
      (l) {
        showToast(text: l.message, state: ToastStates.error);
        emit(UpdateCartFailure());
      },
      (message) {
        if (onUpdate != null) {
          onUpdate();
        }
        emit(UpdateCartLoaded());
      },
    );
  }

  Future<void> deleteCart(
    OfferCartItemModel offerItem,
    BuildContext context,
    VoidCallback? onUpdate,
  ) async {
    emit(DeleteCartLoading());
    // Mapping back to original item id for deletion
    final result = await cartRepository.removeFromCart(
      RemoveFromCartParam(id: offerItem.id),
    );
    result.fold(
      (l) {
        showToast(text: l.message, state: ToastStates.error);
        emit(DeleteCartFailure());
      },
      (message) {
        offerItems.remove(offerItem);
        if (onUpdate != null) {
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

  num calculateTotal(num subtotal, num deliveryCost, num taxAmount) {
    return num.parse(
      (subtotal -
              (calculateDiscountValue(subtotal) ?? 0) +
              deliveryCost +
              taxAmount)
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
