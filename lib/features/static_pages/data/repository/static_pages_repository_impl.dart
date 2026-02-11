import 'package:brandy_user/features/static_pages/data/repository/static_pages_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../data_source/remote/static_pages_remote_data_source.dart';

@Injectable(as: StaticPagesRepository)
class StaticPagesRepositoryImpl extends StaticPagesRepository {
  final StaticPagesRemoteDataSource staticPagesRemoteDataSource;

  StaticPagesRepositoryImpl({required this.staticPagesRemoteDataSource});



  @override
  Future<Either<Failure, String>> fetchTerms() async {
    try {
      String message = await staticPagesRemoteDataSource.fetchTerms();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }


  @override
  Future<Either<Failure, String>> fetchPolicy() async {
    try {
      String message = await staticPagesRemoteDataSource.fetchPolicy();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }
}
