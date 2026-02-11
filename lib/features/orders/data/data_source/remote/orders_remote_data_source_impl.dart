import 'package:brandy_user/features/orders/data/params/orders_param.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../core/models/pagination_data_model.dart';
import '../../../../women/data/models/store_model.dart';
import '../../models/order_model.dart';
import '../../params/re_order_param.dart';
import 'orders_remote_data_source.dart';

@Injectable(as: OrdersRemoteDataSource)
class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final ApiConsumer _apiConsumer;

  OrdersRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<PaginationDataModel<OrderModel>> fetchOrders(OrdersParam param) async {
    BaseResponse response = await _apiConsumer.get(
      ApiConstants.orders,
      queryParameters: param.toJson(),
    );
    if (response.status == true) {
      return PaginationDataModel.fromJson(
        response.data,
        (json) => OrderModel.fromJson(json as Map<String, dynamic>),
      );
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> reOrder(ReOrderParam param) async {
    BaseResponse response = await _apiConsumer.get(
      ApiConstants.reOrder(param.orderId),
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
