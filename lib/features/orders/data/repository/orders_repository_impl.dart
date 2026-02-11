import 'package:brandy_user/core/models/pagination_data_model.dart';
import 'package:brandy_user/features/orders/data/models/order_model.dart';
import 'package:brandy_user/features/orders/data/params/orders_param.dart';
import 'package:brandy_user/features/women/data/models/store_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import 'package:injectable/injectable.dart';

import '../data_source/remote/orders_remote_data_source.dart';
import '../params/re_order_param.dart';
import 'orders_repository.dart';



@Injectable(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource ordersRemoteDataSource;

  OrdersRepositoryImpl(this.ordersRemoteDataSource);

  @override
  Future<Either<Failure,PaginationDataModel<OrderModel>>> fetchOrders(OrdersParam param) async {
    try {
      final result = await ordersRemoteDataSource.fetchOrders(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure,String>> reOrder(ReOrderParam param) async {
    try {
      final result = await ordersRemoteDataSource.reOrder(param);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(e.message!));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

}
