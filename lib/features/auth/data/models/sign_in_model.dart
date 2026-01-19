import 'package:brandy_user/features/auth/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_model.g.dart';


@JsonSerializable(createToJson: false, genericArgumentFactories: true,includeIfNull: true)
class SignInModel {
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @JsonKey(name: 'is_active')
  final bool isActive;
  final UserModel? user;
  final String? token;



  SignInModel({
    required this.isAvailable,
    required this.isActive,
    this.user, this.token,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => _$SignInModelFromJson(json);
}
