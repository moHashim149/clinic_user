import 'package:brandy_user/features/auth/data/models/check_phone_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../models/city_model.dart';
import '../models/sign_in_model.dart';
import '../models/user_model.dart';
import '../params/check_otp_param.dart';
import '../params/create_acc_param.dart';
import '../params/send_code_param.dart';
import '../params/sign_in_param.dart';

abstract class AuthRepository {
  Future<Either<Failure, SignInModel>> signIn({required SignInParam param});

  Future<Either<Failure, CheckPhoneModel>> sendCode({required SendCodeParam param});

  Future<Either<Failure, SignInModel>> createAcc({required CreateAccParam param});

  Future<Either<Failure, List<CityModel>>> fetchCities();

  Either<Failure, dynamic> saveUserData({
    required UserModel user,
    required String token,
  });
}
