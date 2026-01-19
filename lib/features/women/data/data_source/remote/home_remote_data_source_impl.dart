import 'package:injectable/injectable.dart';
import '../../../../../../core/api/api_consumer.dart';
import 'home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSourceImpl(this._apiConsumer);

  // @override
  // Future<UserModel> fetchProfile() async {
  //   BaseResponse response = await _apiConsumer.get(ApiConstants.profile);
  //   if (response.status == true) {
  //     return UserModel.fromJson(response.data);
  //   } else {
  //     throw ServerException(response.message.toString());
  //   }
  // }
  //
  // @override
  // Future<HomeModel> fetchHome() async {
  //   BaseResponse response = await _apiConsumer.get(ApiConstants.home);
  //   if (response.status == true) {
  //     return HomeModel.fromJson(response.data);
  //   } else {
  //     throw ServerException(response.message.toString());
  //   }
  // }

}
