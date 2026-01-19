import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/framework/app_firebase.dart';
import '../../../../../core/helpers/custom_phone_controller.dart';
import '../../../../../core/helpers/image_helper.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/arguments/pin_code_argument.dart';
import '../../../data/models/city_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/params/create_acc_param.dart';
import '../../../data/repository/auth_repository.dart';

part 'create_acc_state.dart';

@injectable
class CreateAccCubit extends Cubit<CreateAccState> {
  final AuthRepository authRepository;
  final AppFirebase appFirebase;
  final DocumentHelper documentHelper;

  CreateAccCubit(
    this.authRepository,
    this.appFirebase,
    this.documentHelper,
  ) : super(CreateAccInitial());

  final formKey = GlobalKey<FormState>();

  final fullNameCtrl = TextEditingController();
  File? userImage;
  CityModel? selectedCity;

  void pickImage() async {
    userImage = await documentHelper.pickImage(type: PickImageFromEnum.gallery);
    emit(GetCitiesSuccess());
  }

  void selectCity(CityModel value) {
    selectedCity = value;
    emit(ChangeValueDropDown());
  }

  List<CityModel> cities = [];

  // void fetchCities() async {
  //   emit(GetCitiesLoading());
  //   var result = await authRepository.fetchCities();
  //   result.fold(
  //     (failure) {
  //       emit(GetCitiesFailure(error: failure.message));
  //     },
  //     (cities) {
  //       this.cities = cities;
  //       emit(GetCitiesSuccess());
  //     },
  //   );
  // }

  // void createAcc({required String phone, required BuildContext context}) async {
  //   if (userImage == null) {
  //     showToast(
  //       text: LocaleKeys.pleaseSelectImage.tr(),
  //       state: ToastStates.error,
  //     );
  //     return;
  //   }
  //
  //   emit(CreateAccLoading());
  //   var result = await authRepository.createAcc(
  //     param: CreateAccParam(
  //       cityId: selectedCity!.id,
  //       deviceKey: await appFirebase.getFirebaseToken() ?? "fcm token",
  //       firstName: firstNameCtrl.text,
  //       lastName: familyNameCtrl.text,
  //       phone: phone,
  //       whatsapp: whatsappCtrl.controller.text,
  //       image: MultipartFile.fromFileSync(userImage!.path),
  //     ),
  //   );
  //   result.fold(
  //     (failure) {
  //       showToast(text: failure.message, state: ToastStates.error);
  //       emit(CreateAccFailure());
  //     },
  //     (signInModel) {
  //       context.pushWithNamed(
  //         Routes.pinCodeView,
  //         arguments: PinCodeArgument(phone: phone),
  //       );
  //     },
  //   );
  // }

  @override
  Future<void> close() {
    fullNameCtrl.dispose();
    return super.close();
  }
}
