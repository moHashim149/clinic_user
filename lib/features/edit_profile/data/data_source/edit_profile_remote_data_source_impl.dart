import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/base_response.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../params/edit_profile_param.dart';
import 'edit_profile_remote_data_source.dart';

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl extends EditProfileRemoteDataSource {
  final ApiConsumer apiConsumer;

  EditProfileRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<String> editProfile(EditProfileParam param) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.updateProfile,
      formDataIsEnabled: true,
      body: param.toJson(),
    );
    if (response.status == true) {
      return response.message.toString();
    } else {
      throw ServerException(response.message.toString());
    }
  }

}
