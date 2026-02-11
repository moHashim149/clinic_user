import 'package:brandy_user/features/product_details/data/data_source/remote/product_details_remote_data_source.dart';
import 'package:brandy_user/features/product_details/data/models/available_size_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/base_response.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../models/product_model.dart';
import '../../params/available_size_param.dart';
import '../../params/product_details_param.dart';

@Injectable(as: ProductDetailsRemoteDataSource)
class ProductDetailsRemoteDataSourceImpl
    implements ProductDetailsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProductDetailsRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<ProductModel> fetchProductDetails(ProductDetailsParam param) async {
    BaseResponse response = await _apiConsumer.get(
      ApiConstants.productDetails(param.productId),
    );
    if (response.status == true) {
      return ProductModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<List<AvailableSizeModel>> fetchProductAvailableSize(
    AvailableSizeParam param,
  ) async {
    BaseResponse response = await _apiConsumer.get(
      ApiConstants.availableSize(param.productId),
      queryParameters: param.toJson(),
    );
    if (response.status == true) {
      return (response.data as List)
          .map((e) => AvailableSizeModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
