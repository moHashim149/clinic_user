import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/base_response.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../models/cart_model.dart';
import '../../models/coupon_model.dart';
import '../../params/check_coupon_param.dart';
import '../../params/remove_from_cart_param.dart';
import '../../params/update_cart_param.dart';
import 'cart_remote_data_source.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final ApiConsumer apiConsumer;

  CartRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> removeFromCart(RemoveFromCartParam param) async {
    BaseResponse response = await apiConsumer.delete(
      ApiConstants.deleteItemFromCart(param.id),
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<CartModel> fetchCart() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.cart);
    if (response.status == true) {
      return CartModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> updateCart(UpdateCartParam param) async {
    BaseResponse response = await apiConsumer.post(ApiConstants.updateCart,body: param.toJson());
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<CouponModel> checkCoupon(CheckCouponParam param) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.checkCoupon,
      body: param.toJson(),
    );
    if (response.status == true) {
      return CouponModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
