import 'package:brandy_user/features/wallet/data/models/payment_model.dart';

import '../../models/wallet_model.dart';
import '../../params/charge_balance_param.dart';

abstract class WalletRemoteDataSource {
  Future<WalletModel> fetchWallet();
  Future<String> chargeBalance({required ChargeBalanceParam param});
  Future<List<PaymentModel>> fetchPayments();
}
