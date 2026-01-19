import 'package:injectable/injectable.dart';

import '../data_source/remote/home_remote_data_source.dart';
import 'home_repository.dart';



@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);
  //
  //  @override
  // Future<Either<Failure, UserModel>> fetchProfile() async{
  //    try {
  //      final result = await userHomeRemoteDataSource.fetchProfile();
  //      return Right(result);
  //    } on ServerException catch (e) {
  //      return Left(ApiFailure(e.message!));
  //    }
  //    catch(e){
  //      return Left(ApiFailure(e.toString()));
  //    }
  // }
  //
  // @override
  // Future<Either<Failure, HomeModel>> fetchHome() async {
  //   try {
  //     final result = await userHomeRemoteDataSource.fetchHome();
  //     return Right(result);
  //   } on ServerException catch (e) {
  //     return Left(ApiFailure(e.message!));
  //   }
  //   catch(e){
  //      return Left(ApiFailure(e.toString()));
  //    }
  // }


}
