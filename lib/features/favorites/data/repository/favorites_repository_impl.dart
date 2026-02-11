import 'package:brandy_user/features/women/data/models/store_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import 'package:injectable/injectable.dart';

import '../data_source/remote/favorites_remote_data_source.dart';
import '../params/fav_store_param.dart';
import 'favorites_repository.dart';

@Injectable(as: FavoritesRepository)
class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource favoritesRemoteDataSource;

  FavoritesRepositoryImpl(this.favoritesRemoteDataSource);

  @override
  Future<Either<Failure, List<StoreModel>>> fetchFavStores() async {
    try {
      final result = await favoritesRemoteDataSource.fetchFavStores();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> toggleFav(FavStoreParam param) async {
    try {
      final result = await favoritesRemoteDataSource.toggleFav(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
