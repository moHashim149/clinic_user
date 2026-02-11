import 'package:brandy_user/core/models/pagination_data_model.dart';
import 'package:brandy_user/features/product_details/data/models/product_model.dart';
import 'package:brandy_user/features/store_details/data/repository/store_details_repository.dart';
import 'package:brandy_user/features/women/data/models/store_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../data_source/remote/store_details_remote_data_source.dart';
import '../models/store_details_model.dart';
import '../params/section_products_param.dart';
import '../params/store_details_param.dart';

@Injectable(as: StoreDetailsRepository)
class StoreDetailsRepositoryImpl implements StoreDetailsRepository {
  final StoreDetailsRemoteDataSource storeDetailsRemoteDataSource;

  StoreDetailsRepositoryImpl(this.storeDetailsRemoteDataSource);

  @override
  Future<Either<Failure, StoreDetailsModel>> fetchStoreDetails(StoreDetailsParam param) async {
    try {
      final result = await storeDetailsRemoteDataSource.fetchStoreDetails(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PaginationDataModel<ProductModel>>> fetchSectionProducts(SectionProductsParam param) async {
    try {
      final result = await storeDetailsRemoteDataSource.fetchSectionProducts(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    }
    catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
