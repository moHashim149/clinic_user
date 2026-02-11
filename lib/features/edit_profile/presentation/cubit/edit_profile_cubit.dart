import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:brandy_user/core/helpers/image_helper.dart';
import 'package:brandy_user/features/auth/data/models/user_model.dart';
import 'package:brandy_user/features/women/data/repository/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/helpers/custom_phone_controller.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../data/params/edit_profile_param.dart';
import '../../data/repository/edit_profile_repository.dart';
part 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final HomeRepository homeRepository;
  final DocumentHelper documentHelper;
  final EditProfileRepository editProfileRepository;
  EditProfileCubit(
    this.homeRepository,
    this.documentHelper,
    this.editProfileRepository,
  ) : super(EditProfileInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  PhoneFieldController phoneCtrl = PhoneFieldController();
  File? userImage;
  UserModel? userModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> fetchProfile() async {
    emit(DataLoading());
    var result = await homeRepository.fetchProfile();
    result.fold(
      (failure) {
        emit(DataFailure(error: failure.message));
      },
      (userModel) {
        this.userModel = userModel;
        nameController.text = userModel.name;
        emailController.text = userModel.email ?? "";
        phoneCtrl.controller.text = userModel.phone ?? "";
        emit(DataLoaded());
      },
    );
  }

  void pickImage() async {
    userImage = await documentHelper.pickImage(type: PickImageFromEnum.gallery);
    emit(DataLoaded());
  }

  void editProfile({required BuildContext context}) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    emit(EditProfileLoading());
    var result = await editProfileRepository.editProfile(
      EditProfileParam(
        name: nameController.text,
        email: emailController.text,
        phone: phoneCtrl.controller.text,
        image: userImage != null
            ? MultipartFile.fromFileSync(userImage!.path)
            : null,
      ),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(EditProfileFailure());
      },
      (message) {
        context.pop();
        emit(EditProfileLoaded());
      },
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneCtrl.dispose();
    return super.close();
  }
}
