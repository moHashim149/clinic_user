
import 'package:brandy_user/core/models/pagination_data_model.dart';
import 'package:brandy_user/features/orders/data/params/orders_param.dart';
import 'package:brandy_user/features/orders/data/params/re_order_param.dart';

import '../../models/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<PaginationDataModel<OrderModel>> fetchOrders(OrdersParam param);
  Future<String> reOrder(ReOrderParam param);
}
