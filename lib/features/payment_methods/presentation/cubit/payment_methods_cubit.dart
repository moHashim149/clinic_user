import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:brandy_user/core/local/shared_preferences/shared_pref_services.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/features/payment_methods/data/data_source/arguments/payment_methods_arguments.dart';
import 'package:brandy_user/features/payment_methods/data/params/place_order_param.dart';
import 'package:brandy_user/features/wallet/data/repository/wallet_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/util/extensions/navigation.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../wallet/data/models/payment_model.dart';
import '../../data/repository/payment_methods_repository.dart';

part 'payment_methods_state.dart';

@injectable
class PaymentMethodsCubit extends Cubit<PaymentMethodsState> {
  final PaymentMethodsRepository repository;
  final WalletRepository walletRepository;
  PaymentMethodsCubit(this.repository, this.walletRepository) : super(PaymentMethodsInitial());

  int currentPaymentIndex = 0;
  List<PaymentModel> payments = [];

  void changePaymentMethod(int index) {
    currentPaymentIndex = index;
    emit(ChangePaymentMethod());
  }



  void fetchPayments() async {
    emit(PaymentsLoading());
    var result = await walletRepository.fetchPayments();
    result.fold((failure) => emit(PaymentsFailure(error: failure.message)), (
      payments,
    ) {
      this.payments = payments
          .where((element) => !(element.id == 3 && Platform.isAndroid))
          .toList();
      emit(PaymentsSuccess());
    });
  }

  void placeOrder({
    required PaymentMethodsArguments arguments,
    required BuildContext context,
  }) async {

    emit(PlaceOrderLoading());
    var result = await repository.placeOrder(
      PlaceOrderParam(locationId: arguments.locationId, paymentMethod: payments[currentPaymentIndex].id, couponCode: arguments.couponCode)
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(PlaceOrderFailure());
      },
      (message) {
        context.pushAndRemoveUntilWithNamed(Routes.bottomNavView);
        emit(PlaceOrderSuccess());
      },
    );
  }

}
