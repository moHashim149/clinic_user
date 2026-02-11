

import '../params/edit_profile_param.dart';

abstract class EditProfileRemoteDataSource {
  Future<String> editProfile(EditProfileParam param);
}
