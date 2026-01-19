import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/wallet_remote_data_source.dart';
import '../models/wallet_model.dart';
import '../params/charge_balance_param.dart';
import 'wallet_repository.dart';

@Injectable(as: WalletRepository)
class WalletRepositoryImpl extends WalletRepository {
  final WalletRemoteDataSource remoteDataSource;

  WalletRepositoryImpl({required this.remoteDataSource});
  //
  // @override
  // Future<Either<Failure, WalletModel>> fetchWallet() async {
  //   try {
  //     WalletModel model = await remoteDataSource.fetchWallet();
  //     return Right(model);
  //   } on ServerException catch (exception) {
  //     return Left(ApiFailure(exception.message!));
  //   } catch (error) {
  //     return Left(Failure(error.toString()));
  //   }
  //
  // }
  //
  // @override
  // Future<Either<Failure, String>> chargeBalance({
  //   required ChargeBalanceParam param,
  // }) async {
  //   try {
  //     String message = await remoteDataSource.chargeBalance(param: param);
  //     return Right(message);
  //   } on ServerException catch (exception) {
  //     return Left(ApiFailure(exception.message!));
  //   } catch (error) {
  //     return Left(Failure(error.toString()));
  //   }
  // }
}
