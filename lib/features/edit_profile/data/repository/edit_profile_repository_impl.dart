import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/edit_profile_remote_data_source.dart';
import '../params/edit_profile_param.dart';
import 'edit_profile_repository.dart';

@Injectable(as: EditProfileRepository)
class EditProfileRepositoryImpl extends EditProfileRepository {
  final EditProfileRemoteDataSource editProfileRemoteDataSource;

  EditProfileRepositoryImpl({
    required this.editProfileRemoteDataSource,
  });


  @override
  Future<Either<Failure, String>> editProfile(EditProfileParam param) async {
    try {
      String message = await editProfileRemoteDataSource.editProfile(param);
      return Right(message);
    } on CacheException catch (exception) {
      return Left(CacheFailure(exception.message!));
    } catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }
}
