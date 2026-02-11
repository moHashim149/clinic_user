import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/framework/app_firebase.dart';
import '../../../../../../core/helpers/custom_phone_controller.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../../../core/util/extensions/navigation.dart';
import '../../../data/arguments/create_acc_argument.dart';
import '../../../data/arguments/pin_code_argument.dart';
import '../../../data/models/user_model.dart';
import '../../../data/params/send_code_param.dart';
import '../../../data/params/sign_in_param.dart';
import '../../../data/repository/auth_repository.dart';

part 'login_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final AuthRepository repository;
  final AppFirebase appFirebase;

  SignInCubit(this.repository, this.appFirebase) : super(SignInInitial());

  PhoneFieldController phoneCtrl = PhoneFieldController();


  void checkPone({required BuildContext context}) async {
    emit(CheckPhoneLoading());
    var result = await repository.sendCode(
      param: SendCodeParam(phone: phoneCtrl.controller.text,type: 1),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(CheckPhoneFailure());
      },
      (checkPhoneModel) {
        emit(CheckPhoneSuccess());
        if (checkPhoneModel.exists) {
          context.pushWithNamed(
            Routes.pinCodeView,
            arguments: PinCodeArgument(phone: phoneCtrl.controller.text),
          );
        } else {
          context.pushWithNamed(
            Routes.createAccountView,
            arguments: CreateAccArgument(
              phone: phoneCtrl.controller.text,
            ),
          );
        }
      },
    );
  }



  @override
  Future<void> close() {
    phoneCtrl.dispose();

    return super.close();
  }
}
