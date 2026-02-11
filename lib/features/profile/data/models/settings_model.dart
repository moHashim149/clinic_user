import 'package:json_annotation/json_annotation.dart';

part 'settings_model.g.dart';

@JsonSerializable(createToJson: false)
class SettingsModel {
  @JsonKey(name: 'android_url')
  final String androidUrl;
  @JsonKey(name: 'ios_url')
  final String iosUrl;





  SettingsModel({
    required this.androidUrl,
    required this.iosUrl,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);
}
