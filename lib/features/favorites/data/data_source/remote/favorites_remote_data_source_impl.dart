import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../core/models/pagination_data_model.dart';
import '../../../../women/data/models/store_model.dart';
import '../../params/fav_store_param.dart';
import 'favorites_remote_data_source.dart';

@Injectable(as: FavoritesRemoteDataSource)
class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {
  final ApiConsumer _apiConsumer;

  FavoritesRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<List<StoreModel>> fetchFavStores() async {
    BaseResponse response = await _apiConsumer.get(ApiConstants.favStores);
    if (response.status == true) {
      return (response.data as List).map((e) => StoreModel.fromJson(e)).toList();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> toggleFav(FavStoreParam param) async {
    BaseResponse response = await _apiConsumer.post(ApiConstants.toggleFav(param.storeId));
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }



}
