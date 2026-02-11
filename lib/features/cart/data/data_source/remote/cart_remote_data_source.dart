import '../../models/cart_model.dart';
import '../../models/coupon_model.dart';
import '../../params/check_coupon_param.dart';
import '../../params/remove_from_cart_param.dart';
import '../../params/update_cart_param.dart';


abstract class CartRemoteDataSource {
  Future<String> removeFromCart(RemoveFromCartParam param);
  Future<String> updateCart(UpdateCartParam param);
  Future<CartModel> fetchCart();
  Future<CouponModel> checkCoupon(CheckCouponParam param);

}
