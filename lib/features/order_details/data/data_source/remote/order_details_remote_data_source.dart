
import 'package:brandy_user/features/orders/data/models/order_model.dart';

import '../../params/order_details_param.dart';

abstract class OrderDetailsRemoteDataSource {
  Future<OrderModel> fetchOrderDetails(OrderDetailsParam param);
}
