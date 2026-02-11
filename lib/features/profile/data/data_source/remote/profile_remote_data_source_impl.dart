import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/base_response.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../models/settings_model.dart';
import 'profile_remote_data_source.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiConsumer apiConsumer;

  ProfileRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> logout() async {
    BaseResponse response = await apiConsumer.post(ApiConstants.logout);
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<String> deleteAcc() async {
    BaseResponse response = await apiConsumer.post(ApiConstants.deleteAcc);
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<SettingsModel> fetchSettings() async {
    BaseResponse response = await apiConsumer.get(ApiConstants.settings);
    if (response.status == true) {
      return SettingsModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }
}
