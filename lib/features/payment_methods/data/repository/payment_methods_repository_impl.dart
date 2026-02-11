import 'package:brandy_user/features/payment_methods/data/repository/payment_methods_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../data_source/remote/payment_methods_remote_data_source.dart';
import '../params/place_order_param.dart';

@Injectable(as: PaymentMethodsRepository)
class PaymentMethodsRepositoryImpl extends PaymentMethodsRepository {
  final PaymentMethodsRemoteDataSource paymentMethodsRemoteDataSource;

  PaymentMethodsRepositoryImpl({required this.paymentMethodsRemoteDataSource});


  @override
  Future<Either<Failure, String>> placeOrder(
      PlaceOrderParam param,
      ) async {
    try {
      String message = await paymentMethodsRemoteDataSource
          .placeOrder(param);
      return Right(message);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
    catch (exception) {
      return Left(Failure(exception.toString()));
    }
  }

}
