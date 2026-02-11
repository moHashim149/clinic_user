import 'package:brandy_user/core/models/pagination_data_model.dart';
import 'package:brandy_user/features/orders/data/models/order_model.dart';
import 'package:brandy_user/features/orders/data/params/orders_param.dart';
import 'package:brandy_user/features/women/data/models/store_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../params/re_order_param.dart';


abstract class OrdersRepository {
  Future<Either<Failure, PaginationDataModel<OrderModel>>> fetchOrders(OrdersParam param);
  Future<Either<Failure, String>> reOrder(ReOrderParam param);
}
