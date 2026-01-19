import '../../models/city_model.dart';
import '../../models/sign_in_model.dart';
import '../../params/check_otp_param.dart';
import '../../params/create_acc_param.dart';
import '../../params/send_code_param.dart';
import '../../params/sign_in_param.dart';

abstract class AuthRemoteDataSource {
  // Future<SignInModel> signIn({required SignInParam param});
  //
  // Future<String> sendCode({required SendCodeParam param});
  //
  // Future<SignInModel> checkOtp({required CheckOtpParam param});
  //
  // Future<SignInModel> createAcc({required CreateAccParam param});
  //
  // Future<List<CityModel>> fetchCities();
}
