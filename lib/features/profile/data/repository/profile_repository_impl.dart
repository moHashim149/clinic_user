import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/local/profile_local_data_source.dart';
import '../data_source/remote/profile_remote_data_source.dart';
import '../models/settings_model.dart';
import 'profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;

  ProfileRepositoryImpl({
    required this.profileRemoteDataSource,
    required this.profileLocalDataSource,
  });



  @override
  Future<Either<Failure, String>> logout() async {
    try {
      String message = await profileRemoteDataSource.logout();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    } catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAcc() async {
    try {
      String message = await profileRemoteDataSource.deleteAcc();
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    } catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, None>> clearDataUser() async {
    try {
      await profileLocalDataSource.clearDataUser();
      return const Right(None());
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message!));
    } catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }

  @override
  Future<Either<Failure, SettingsModel>> fetchSettings() async {
    try {
      SettingsModel settingsModel = await profileRemoteDataSource
          .fetchSettings();
      return Right(settingsModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    } catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }
}
