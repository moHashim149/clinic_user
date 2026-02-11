import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/widgets.dart';

import '../../../data/models/wallet_model.dart';
import '../../../data/repository/wallet_repository.dart';

part 'wallet_state.dart';

@injectable
class WalletCubit extends Cubit<WalletState> {
  final WalletRepository repository;
  WalletCubit(this.repository) : super(WalletInitial());

  WalletModel? walletModel;

  void fetchWallet() async {
    emit(GetWalletLoading());
    var result = await repository.fetchWallet();
    result.fold((failure) => emit(GetWalletFailure(error: failure.message)), (
      walletModel,
    ) {
      this.walletModel = walletModel;
      emit(GetWalletSuccess());
    });
  }
}
