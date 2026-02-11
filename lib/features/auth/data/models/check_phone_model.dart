import 'package:brandy_user/features/auth/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_phone_model.g.dart';


@JsonSerializable(createToJson: false,)
class CheckPhoneModel {
  final bool exists;

  CheckPhoneModel({
    required this.exists,
  });

  factory CheckPhoneModel.fromJson(Map<String, dynamic> json) => _$CheckPhoneModelFromJson(json);
}
