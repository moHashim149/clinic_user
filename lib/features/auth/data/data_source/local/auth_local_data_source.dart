import '../../models/user_model.dart';

abstract class AuthLocalDataSource {
  void saveDataUser({required UserModel user, required String token});
}
