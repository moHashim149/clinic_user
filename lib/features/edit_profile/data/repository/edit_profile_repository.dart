import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../params/edit_profile_param.dart';

abstract class EditProfileRepository {

  Future<Either<Failure, String>> editProfile(EditProfileParam param);
}
