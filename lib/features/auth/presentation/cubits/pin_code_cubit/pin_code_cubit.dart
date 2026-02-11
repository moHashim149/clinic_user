import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:brandy_user/core/framework/app_firebase.dart';
import 'package:brandy_user/features/auth/data/params/sign_in_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../../../core/util/extensions/navigation.dart';
import '../../../data/models/user_model.dart';
import '../../../data/params/check_otp_param.dart';
import '../../../data/params/send_code_param.dart';
import '../../../data/repository/auth_repository.dart';
part 'pin_code_state.dart';

@injectable
class PinCodeCubit extends Cubit<PinCodeState> {
  final AuthRepository repository;
  final AppFirebase appFirebase;

  PinCodeCubit(this.repository, this.appFirebase) : super(PinCodeInitial());

  final pinCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void sendCode({
    required VoidCallback timer,
    required SendCodeParam param,
  }) async {
    emit(ResendCodeLoading());
    var result = await repository.sendCode(param: param);
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(PinCodeFailure());
      },
      (message) {
        timer();
        emit(PinCodeSuccess());
      },
    );
  }

  void signIn({required BuildContext context, required String phone}) async {
    emit(PinCodeLoading());

    var result = await repository.signIn(
      param: SignInParam(
        phone: phone,
        otp: pinCtrl.text,
        deviceKey: await appFirebase.getFirebaseToken() ?? "fcm token",
      ),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(PinCodeFailure());
      },
      (signInModel) {
        saveDataUser(
          user: signInModel.user!,
          token: signInModel.token!,
          context: context,
        );
      },
    );
  }

  void saveDataUser({
    required UserModel user,
    required String token,
    required BuildContext context,
  }) {
    emit(PinCodeLoading());
    var result = repository.saveUserData(user: user, token: token);
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(SaveDataFailure());
      },
      (r) {
        context.pushAndRemoveUntilWithNamed(Routes.bottomNavView);
        emit(PinCodeSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    pinCtrl.dispose();
    return super.close();
  }
}
