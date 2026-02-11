import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/cart_remote_data_source.dart';
import '../models/cart_model.dart';
import '../models/coupon_model.dart';
import '../params/check_coupon_param.dart';
import '../params/remove_from_cart_param.dart';
import '../params/update_cart_param.dart';
import 'cart_repository.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, String>> removeFromCart(RemoveFromCartParam param) async {
    try {
      String message = await cartRemoteDataSource.removeFromCart(param);
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
    catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> fetchCart() async {
    try {
      CartModel cartModel = await cartRemoteDataSource.fetchCart();
      return Right(cartModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
    catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateCart(UpdateCartParam param) async {
    try {
      String message = await cartRemoteDataSource.updateCart(param);
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
    catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, CouponModel>> checkCoupon(

      CheckCouponParam param,
      ) async {
    try {
      CouponModel checkCouponModel = await cartRemoteDataSource
          .checkCoupon(param);
      return Right(checkCouponModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
    catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }

}
