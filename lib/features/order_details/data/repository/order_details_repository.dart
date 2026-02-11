import 'package:brandy_user/core/models/pagination_data_model.dart';
import 'package:brandy_user/features/orders/data/models/order_model.dart';
import 'package:brandy_user/features/orders/data/params/orders_param.dart';
import 'package:brandy_user/features/women/data/models/store_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../params/order_details_param.dart';


abstract class OrderDetailsRepository {
  Future<Either<Failure, OrderModel>> fetchOrderDetails(OrderDetailsParam param);
}
