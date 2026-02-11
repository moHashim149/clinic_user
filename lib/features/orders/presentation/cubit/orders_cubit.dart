import 'package:bloc/bloc.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/features/orders/data/models/order_model.dart';
import 'package:brandy_user/features/orders/data/repository/orders_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/models/pagination_data_model.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../data/params/orders_param.dart';
import '../../data/params/re_order_param.dart';

part 'orders_state.dart';

enum OrderStatus {
  all(0),
  newOrder(1),
  preparing(2),
  delivering(3),
  delivered(4),
  cancelled(5),
  rejected(6);

  final int id;
  const OrderStatus(this.id);
}

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepository ordersRepository;
  OrdersCubit(this.ordersRepository) : super(OrdersInitial());

  List<OrderModel> orders = [];
  int page = 1;
  RefreshController refreshController = RefreshController();
  PaginationDataModel<OrderModel>? paginationDataModel;

  Future<void> fetchOrders({int? status}) async {
    if (page != 1) {
      emit(OrdersPaginationLoading());
    } else {
      emit(OrdersLoading());
    }
    final result = await ordersRepository.fetchOrders(
      OrdersParam(page: page, status: status == 0 ? null : status),
    );
    result.fold(
      (failure) {
        if (page != 1) {
          refreshController.loadFailed();
          showToast(text: failure.message, state: ToastStates.error);
          emit(OrdersPaginationFailure());
        } else {
          emit(OrdersFailure(failure.message));
        }
      },
      (paginationDataModel) async {
        this.paginationDataModel = paginationDataModel;
        if (page != 1) {
          orders.addAll(paginationDataModel.list);
          refreshController.loadComplete();
          emit(OrdersLoaded());
        } else {
          refreshController.refreshCompleted();
          refreshController.loadComplete();
          orders.clear();
          orders.addAll(paginationDataModel.list);
          emit(OrdersLoaded());
        }
      },
    );
  }

  void refreshOrders() {
    page = 1;
    fetchOrders();
  }

  void paginateOrders() {
    if (state is! OrdersPaginationFailure) {
      if (paginationDataModel!.list.isNotEmpty) {
        page++;
        fetchOrders();
      } else {
        refreshController.loadNoData();
      }
    } else {
      fetchOrders();
    }
  }

  Future<void> reOrder(int orderId, BuildContext context) async {
    emit(ReOrderLoading());
    final result = await ordersRepository.reOrder(
      ReOrderParam(orderId: orderId),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(ReOrderFailure());
      },
      (message) {
        showToast(text: message, state: ToastStates.success);
        emit(ReOrderLoaded());
        context.pushWithNamed(Routes.cartView);
      },
    );
  }
}
