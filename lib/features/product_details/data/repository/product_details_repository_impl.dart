import 'package:brandy_user/features/product_details/data/models/available_size_model.dart';
import 'package:brandy_user/features/product_details/data/repository/product_details_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../data_source/remote/product_details_remote_data_source.dart';
import '../models/product_model.dart';
import '../params/available_size_param.dart';
import '../params/product_details_param.dart';

@Injectable(as: ProductDetailsRepository)
class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;

  ProductDetailsRepositoryImpl(this.productDetailsRemoteDataSource);

  @override
  Future<Either<Failure, ProductModel>> fetchProductDetails(
    ProductDetailsParam param,
  ) async {
    try {
      final result = await productDetailsRemoteDataSource.fetchProductDetails(
        param,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AvailableSizeModel>>> fetchAvailableSize(
    AvailableSizeParam param,
  ) async {
    try {
      final result = await productDetailsRemoteDataSource
          .fetchProductAvailableSize(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
