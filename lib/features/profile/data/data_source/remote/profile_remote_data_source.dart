
import '../../models/settings_model.dart';

abstract class ProfileRemoteDataSource {
  Future<String> logout();
  Future<String> deleteAcc();
  Future<SettingsModel> fetchSettings();
}
