import 'package:brandy_user/features/women/data/models/store_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../params/fav_store_param.dart';


abstract class FavoritesRepository {
  Future<Either<Failure, List<StoreModel>>> fetchFavStores();
  Future<Either<Failure, String>> toggleFav(FavStoreParam param);
}
