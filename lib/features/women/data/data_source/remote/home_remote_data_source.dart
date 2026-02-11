

import 'package:brandy_user/features/women/data/params/home_param.dart';

import '../../../../auth/data/models/user_model.dart';
import '../../models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<UserModel> fetchProfile();
  Future<HomeModel> fetchHome(HomeParam param);
}
