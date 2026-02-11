import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/settings_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, String>> logout();
  Future<Either<Failure, String>> deleteAcc();
  Future<Either<Failure, None>> clearDataUser();
  Future<Either<Failure, SettingsModel>> fetchSettings();
}
