
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../data/repository/wallet_repository.dart';

part 'charge_wallet_state.dart';

@injectable
class ChargeWalletCubit extends Cubit<ChargeWalletState> {
  final WalletRepository repository;

  ChargeWalletCubit(this.repository)
    : super(ChargeWalletInitial());


  final balanceCtrl = TextEditingController();
  // PaymentModel? currentPayment;
  //
  // List<PaymentModel> payments = [
  //   PaymentModel(
  //     name: LocaleKeys.creditCard,
  //     icons: [
  //       AppAssets.mada,
  //       AppAssets.visa,
  //       AppAssets.masterCard,
  //       AppAssets.americanExpress,
  //     ],
  //   ),
  //   if (Platform.isIOS)
  //     PaymentModel(name: LocaleKeys.applePay, icons: [AppAssets.applePay]),
  //
  //   PaymentModel(name: LocaleKeys.stcBank, icons: [AppAssets.stcPay]),
  // ];

  // void changePaymentMethod(PaymentModel payment) {
  //   currentPayment = payment;
  //   emit(ChangePaymentMethod());
  // }



  // void chargeBalance({
  //   required VoidCallback onUpdate,
  //   required BuildContext context,
  // }) async {
  //   emit(ChargeWalletLoading());
  //   var result = await repository.chargeBalance(
  //     param: ChargeBalanceParam(
  //       amount: balanceCtrl.controller.text,
  //       paymentMethod: currentPayment!.name == LocaleKeys.creditCard
  //           ? "credit_card"
  //           : currentPayment!.name == LocaleKeys.applePay
  //           ? "apple_pay"
  //           : "stc_bank",
  //     ),
  //   );
  //   if (isClosed) return;
  //   result.fold(
  //     (failure) {
  //       showToast(text: failure.message, state: ToastStates.error);
  //       emit(ChargeWalletFailure());
  //     },
  //     (message) {
  //       onUpdate();
  //       context.pop();
  //       emit(ChargeWalletSuccess());
  //     },
  //   );
  // }


  @override
  Future<void> close() {
    balanceCtrl.dispose();
    return super.close();
  }
}
