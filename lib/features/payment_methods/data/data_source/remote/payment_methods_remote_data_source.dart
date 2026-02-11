
import '../../params/place_order_param.dart';

abstract class PaymentMethodsRemoteDataSource {
  Future<String> placeOrder(PlaceOrderParam param);

}
