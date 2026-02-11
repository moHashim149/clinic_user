import 'package:brandy_user/features/store_details/data/data_source/remote/store_details_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/base_response.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/models/pagination_data_model.dart';
import '../../../../product_details/data/models/product_model.dart';
import '../../models/store_details_model.dart';
import '../../params/section_products_param.dart';
import '../../params/store_details_param.dart';

@Injectable(as: StoreDetailsRemoteDataSource)
class StoreDetailsRemoteDataSourceImpl implements StoreDetailsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  StoreDetailsRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<StoreDetailsModel> fetchStoreDetails(StoreDetailsParam param) async {
    BaseResponse response = await _apiConsumer.get(
      ApiConstants.storeDetails(param.storeId),
      queryParameters: param.toJson()
    );
    if (response.status == true) {
      return StoreDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<PaginationDataModel<ProductModel>> fetchSectionProducts(
    SectionProductsParam param,
  ) async {
    BaseResponse response = await _apiConsumer.get(
      ApiConstants.sectionProductsDetails(param.storeId, param.sectionId
      ),
      queryParameters: param.toJson()
    );
    if (response.status == true) {
      return PaginationDataModel.fromJson(
        response.data,
        (json) => ProductModel.fromJson(json as Map<String, dynamic>),
      );
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
