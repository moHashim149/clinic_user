import 'package:brandy_user/features/payment_methods/data/data_source/remote/payment_methods_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/base_response.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../params/place_order_param.dart';

@Injectable(as: PaymentMethodsRemoteDataSource)
class PaymentMethodsRemoteDataSourceImpl extends PaymentMethodsRemoteDataSource {
  final ApiConsumer apiConsumer;

  PaymentMethodsRemoteDataSourceImpl({required this.apiConsumer});


  @override
  Future<String> placeOrder(PlaceOrderParam param) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.createOrder,
      body: param.toJson(),
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
