import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../models/sign_in_model.dart';
import '../models/user_model.dart';
import '../params/check_otp_param.dart';
import '../params/send_code_param.dart';
import '../params/sign_in_param.dart';

abstract class AuthRepository {
  // Future<Either<Failure, SignInModel>> signIn({required SignInParam param});
  //
  // Future<Either<Failure, String>> sendCode({required SendCodeParam param});
  //
  // Future<Either<Failure, SignInModel>> checkOtp({required CheckOtpParam param});
  //
  // Future<Either<Failure, SignInModel>> createAcc({required CreateAccParam param});
  //
  // Future<Either<Failure, List<CityModel>>> fetchCities();
  //
  // Either<Failure, dynamic> saveUserData({
  //   required UserModel user,
  //   required String token,
  // });
}
