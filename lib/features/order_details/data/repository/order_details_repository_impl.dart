import 'package:brandy_user/features/orders/data/models/order_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import 'package:injectable/injectable.dart';

import '../data_source/remote/order_details_remote_data_source.dart';
import '../params/order_details_param.dart';
import 'order_details_repository.dart';



@Injectable(as: OrderDetailsRepository)
class OrderDetailsRepositoryImpl implements OrderDetailsRepository {
  final OrderDetailsRemoteDataSource orderDetailsRemoteDataSource;

  OrderDetailsRepositoryImpl(this.orderDetailsRemoteDataSource);

  @override
  Future<Either<Failure,OrderModel>> fetchOrderDetails(OrderDetailsParam param) async {
    try {
      final result = await orderDetailsRemoteDataSource.fetchOrderDetails(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    }
    catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

}
