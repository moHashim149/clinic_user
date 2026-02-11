import 'package:brandy_user/features/women/data/params/home_param.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/data/models/user_model.dart';
import '../data_source/remote/home_remote_data_source.dart';
import '../models/home_model.dart';
import 'home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

   @override
  Future<Either<Failure, UserModel>> fetchProfile() async{
     try {
       final result = await homeRemoteDataSource.fetchProfile();
       return Right(result);
     } on ServerException catch (e) {
       return Left(ApiFailure(e.message!));
     }
     catch(e){
       return Left(ApiFailure(e.toString()));
     }
  }

  @override
  Future<Either<Failure, HomeModel>> fetchHome(HomeParam param) async {
    try {
      final result = await homeRemoteDataSource.fetchHome(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    }
    catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
