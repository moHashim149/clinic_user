import 'package:brandy_user/features/wallet/data/models/payment_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../models/wallet_model.dart';
import '../params/charge_balance_param.dart';

abstract class WalletRepository {
  Future<Either<Failure, WalletModel>> fetchWallet();

  Future<Either<Failure, String>> chargeBalance({required ChargeBalanceParam param});
  Future<Either<Failure, List<PaymentModel>>> fetchPayments();


}
