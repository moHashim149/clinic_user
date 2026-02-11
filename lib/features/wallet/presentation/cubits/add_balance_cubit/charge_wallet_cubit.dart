import 'package:bloc/bloc.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/util/extensions/navigation.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/payment_model.dart';
import '../../../data/params/charge_balance_param.dart';
import '../../../data/repository/wallet_repository.dart';

part 'charge_wallet_state.dart';

@injectable
class ChargeWalletCubit extends Cubit<ChargeWalletState> {
  final WalletRepository repository;

  ChargeWalletCubit(this.repository) : super(ChargeWalletInitial());

  final balanceCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PaymentModel? currentPayment;
  List<PaymentModel> payments = [];

  void changePaymentMethod(PaymentModel payment) {
    currentPayment = payment;
    emit(ChangePaymentMethod());
  }

  void fetchPayments() async {
    emit(PaymentsLoading());
    var result = await repository.fetchPayments();
    result.fold((failure) => emit(PaymentsFailure(error: failure.message)), (
      payments,
    ) {
      this.payments = payments
          .where((element) => element.id == 4 || element.id == 3)
          .toList();
      currentPayment = this.payments.first;
      emit(PaymentsSuccess());
    });
  }

  void chargeBalance({
    required VoidCallback onUpdate,
    required BuildContext context,
  }) async {
    emit(ChargeWalletLoading());
    var result = await repository.chargeBalance(
      param: ChargeBalanceParam(amount: balanceCtrl.text),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(ChargeWalletFailure());
      },
      (message) {
        onUpdate();
        context.pop();
        emit(ChargeWalletSuccess());
      },
    );
  }

  @override
  Future<void> close() {
    balanceCtrl.dispose();
    return super.close();
  }
}
