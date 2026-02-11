import 'package:brandy_user/features/women/data/params/home_param.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/base_response.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../models/home_model.dart';
import 'home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<UserModel> fetchProfile() async {
    BaseResponse response = await _apiConsumer.get(ApiConstants.profile);
    if (response.status == true) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<HomeModel> fetchHome(HomeParam param) async {
    BaseResponse response = await _apiConsumer.get(ApiConstants.home,queryParameters: param.toJson());
    if (response.status == true) {
      return HomeModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

}
