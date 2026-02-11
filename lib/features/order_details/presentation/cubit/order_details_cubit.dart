import 'package:bloc/bloc.dart';
import 'package:brandy_user/features/order_details/data/repository/order_details_repository.dart';
import 'package:brandy_user/features/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../data/params/order_details_param.dart';

part 'order_details_state.dart';

@injectable
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final OrderDetailsRepository repository;
  OrderDetailsCubit(this.repository) : super(OrderDetailsInitial());

  OrderModel? orderModel;

  Future<void> fetchOrderDetails(int orderId) async {
    emit(OrderDetailsLoading());
    final result = await repository.fetchOrderDetails(
      OrderDetailsParam(orderId: orderId),
    );
    result.fold(
      (failure) {
        emit(OrderDetailsFailure(error: failure.message));
      },
      (orderModel) {
        this.orderModel = orderModel;
        emit(OrderDetailsLoaded());
      },
    );
  }
}
