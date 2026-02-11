
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../params/place_order_param.dart';


abstract class PaymentMethodsRepository {
  Future<Either<Failure, String>> placeOrder(PlaceOrderParam param);

}
