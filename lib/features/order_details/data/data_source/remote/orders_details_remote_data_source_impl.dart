import 'package:brandy_user/features/orders/data/models/order_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../params/order_details_param.dart';
import 'order_details_remote_data_source.dart';


@Injectable(as: OrderDetailsRemoteDataSource)
class OrderDetailsRemoteDataSourceImpl implements OrderDetailsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  OrderDetailsRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<OrderModel> fetchOrderDetails(OrderDetailsParam param) async {
    BaseResponse response = await _apiConsumer.get(ApiConstants.orderDetails(param.orderId));
    if (response.status == true) {
      return OrderModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
