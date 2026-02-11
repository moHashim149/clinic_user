
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/cart_model.dart';
import '../models/coupon_model.dart';
import '../params/check_coupon_param.dart';
import '../params/remove_from_cart_param.dart';
import '../params/update_cart_param.dart';



abstract class CartRepository {
  Future<Either<Failure, String>> removeFromCart(RemoveFromCartParam param);
  Future<Either<Failure, String>> updateCart(UpdateCartParam param);
  Future<Either<Failure, CartModel>> fetchCart();
  Future<Either<Failure, CouponModel>> checkCoupon(CheckCouponParam param);

}
