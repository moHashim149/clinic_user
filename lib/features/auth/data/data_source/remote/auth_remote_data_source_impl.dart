import 'package:brandy_user/features/auth/data/models/check_phone_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../models/city_model.dart';
import '../../models/sign_in_model.dart';
import '../../params/check_otp_param.dart';
import '../../params/create_acc_param.dart';
import '../../params/send_code_param.dart';
import '../../params/sign_in_param.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<SignInModel> login({required SignInParam param}) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.login,
      body: param.toJson(),
    );
    if (response.status == true) {
      return SignInModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<CheckPhoneModel> sendCode({required SendCodeParam param}) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.sendCode,
      body: param.toJson(),
    );
    if (response.status == true) {
      return CheckPhoneModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }


  @override
  Future<SignInModel> createAcc({required CreateAccParam param}) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.createAccount,
      body: param.toJson(),
      formDataIsEnabled: true,
    );
    if (response.status == true) {
      return SignInModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<List<CityModel>> fetchCities() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.cities);
    if (response.status == true) {
      return response.data
          .map<CityModel>((json) => CityModel.fromJson(json))
          .toList();
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
