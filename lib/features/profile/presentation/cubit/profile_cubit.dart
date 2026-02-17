import 'package:bloc/bloc.dart';
import 'package:brandy_user/core/constants/app_cached.dart';
import 'package:brandy_user/core/local/shared_preferences/shared_pref_services.dart';
import 'package:brandy_user/features/profile/data/models/settings_model.dart';
import 'package:brandy_user/features/profile/data/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import '../../../../core/widgets/custom_toast.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  final SharedPrefServices appPrefs;
  ProfileCubit(this.profileRepository, this.appPrefs) : super(ProfileInitial());

  String? get token => appPrefs.getData(key: AppCached.token);
  SettingsModel? settingsModel;

  void updateUi(){
    emit(ProfileSuccess());
  }

  void logOut({required BuildContext context}) async {
    emit(LogOutLoading());
    var result = await profileRepository.logout();
    result.fold(
      (failure) {
        context.pop();
        showToast(text: failure.message, state: ToastStates.error);
        emit(DeleteAccAndLogOutFailure());
      },
      (message) {
        clearUserData(context: context, message: message);
      },
    );
  }

  void deleteAcc({required BuildContext context}) async {
    emit(DeleteAccLoading());
    var result = await profileRepository.deleteAcc();
    result.fold(
      (failure) {
        context.pop();
        showToast(text: failure.message, state: ToastStates.error);
        emit(DeleteAccAndLogOutFailure());
      },
      (message) {
        clearUserData(context: context, message: message);
      },
    );
  }

  void clearUserData({
    required BuildContext context,
    required String message,
  }) async {
    var result = await profileRepository.clearDataUser();
    result.fold(
      (failure) {
        context.pop();
        showToast(text: failure.message, state: ToastStates.error);
        emit(DeleteAccAndLogOutFailure());
      },
      (r) {
        context.pushAndRemoveUntilWithNamed(Routes.signInView);
        emit(DeleteAccAndLogOutSuccess());
      },
    );
  }

  void fetchSettings() async {
    emit(ProfileLoading());
    var result = await profileRepository.fetchSettings();
    result.fold(
          (l) {
        emit(ProfileFailure());
      },
          (r) {
        settingsModel = r;
        emit(ProfileSuccess());
      },
    );
  }
}
