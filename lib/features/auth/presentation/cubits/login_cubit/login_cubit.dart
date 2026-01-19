import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/framework/app_firebase.dart';
import '../../../../../../core/helpers/custom_phone_controller.dart';
import '../../../../../../core/util/routing/routes.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../data/arguments/create_acc_argument.dart';
import '../../../data/arguments/pin_code_argument.dart';
import '../../../data/models/user_model.dart';
import '../../../data/params/sign_in_param.dart';
import '../../../data/repository/auth_repository.dart';

part 'login_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final AuthRepository repository;
  final AppFirebase appFirebase;

  SignInCubit(this.repository, this.appFirebase) : super(SignInInitial());

  PhoneFieldController phoneCtrl = PhoneFieldController();
  TextEditingController emailCtrl = TextEditingController();
  bool isEmail = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void toggleCredentialType() {
    isEmail = !isEmail;
    emit(SignInSuccess());
  }

  // void signIn({required BuildContext context}) async {
  //   emit(SignInLoading());
  //   var phone = phoneCtrl.controller.text.startsWith("0")
  //       ? phoneCtrl.controller.text.substring(1)
  //       : phoneCtrl.controller.text;
  //
  //   var result = await repository.signIn(
  //     param: SignInParam(
  //       phone: phone,
  //       deviceKey: await appFirebase.getFirebaseToken() ?? "fcm token",
  //     ),
  //   );
  //   result.fold(
  //     (failure) {
  //       showToast(text: failure.message, state: ToastStates.error);
  //       emit(SignInFailure());
  //     },
  //     (signInModel) {
  //       emit(SignInSuccess());
  //       if (signInModel.isAvailable) {
  //         if (signInModel.isActive) {
  //           saveDataUser(
  //             user: signInModel.user!,
  //             token: signInModel.token!,
  //             context: context,
  //           );
  //         } else {
  //           context.pushWithNamed(
  //             Routes.pinCodeView,
  //             arguments: PinCodeArgument(phone: phone),
  //           );
  //         }
  //       } else {
  //         context.pushWithNamed(
  //           Routes.createAccView,
  //           arguments: CreateAccArgument(phone: phone),
  //         );
  //       }
  //     },
  //   );
  // }

  // void saveDataUser({
  //   required UserModel user,
  //   required String token,
  //   required BuildContext context,
  // }) {
  //   emit(SignInLoading());
  //   var result = repository.saveUserData(user: user, token: token);
  //   result.fold(
  //     (failure) {
  //       showToast(text: failure.message, state: ToastStates.error);
  //       emit(SignInFailure());
  //     },
  //     (r) {
  //       context.pushAndRemoveUntilWithNamed(Routes.bottomNavView);
  //       emit(SignInSuccess());
  //     },
  //   );
  // }

  @override
  Future<void> close() {
    phoneCtrl.dispose();
    emailCtrl.dispose();
    return super.close();
  }
}
