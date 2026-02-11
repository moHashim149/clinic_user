import 'package:brandy_user/features/auth/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_model.g.dart';


@JsonSerializable(createToJson: false, genericArgumentFactories: true,includeIfNull: true)
class SignInModel {
  final UserModel? user;
  final String? token;



  SignInModel({
    this.user, this.token,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => _$SignInModelFromJson(json);
}
