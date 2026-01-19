import 'package:injectable/injectable.dart';

import '../../../../../../core/api/api_consumer.dart';
import '../../../../../../core/api/base_response.dart';
import '../../../../../../core/constants/api_constants.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../models/wallet_model.dart';
import '../../params/charge_balance_param.dart';
import 'wallet_remote_data_source.dart';

@Injectable(as: WalletRemoteDataSource)
class WalletRemoteDataSourceImpl extends WalletRemoteDataSource {
  final ApiConsumer apiConsumer;

  WalletRemoteDataSourceImpl({required this.apiConsumer});

  // @override
  // Future<WalletModel> fetchWallet() async {
  //   BaseResponse response = await apiConsumer.get(ApiConstants.wallet);
  //   if (response.status == true) {
  //     return WalletModel.fromJson(response.data);
  //   } else {
  //     throw ServerException(response.message.toString());
  //   }
  // }
  //
  // @override
  // Future<String> chargeBalance({required ChargeBalanceParam param}) async {
  //   BaseResponse response = await apiConsumer.post(
  //     ApiConstants.chargeWallet,
  //     body: param.toJson(),
  //   );
  //   if (response.status == true) {
  //     return response.message.toString();
  //   } else {
  //     throw ServerException(response.message.toString());
  //   }
  // }
}
