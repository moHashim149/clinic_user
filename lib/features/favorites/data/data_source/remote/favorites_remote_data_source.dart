
import 'package:brandy_user/features/favorites/data/params/fav_store_param.dart';
import 'package:brandy_user/features/women/data/models/store_model.dart';


abstract class FavoritesRemoteDataSource {
  Future<List<StoreModel>> fetchFavStores();
  Future<String> toggleFav(FavStoreParam param);
}
