import 'package:brandy_user/features/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/framework/spaces.dart';
import 'custom_order_item_widget.dart';

class CustomOrdersListWidget extends StatelessWidget {
  final List<OrderModel> orders;
  final RefreshController refreshController;
  final VoidCallback onRefresh, onLoading;
  final Function(int index) reorder;
  final bool reOrderLoading;
  const CustomOrdersListWidget({
    super.key,
    required this.orders,
    required this.refreshController,
    required this.onRefresh,
    required this.onLoading,
    required this.reorder,
    required this.reOrderLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      enablePullUp: true,
      child: ListView.separated(
        separatorBuilder: (context, index) => heightSpace(16.h),
        itemCount: orders.length,
        padding: EdgeInsets.symmetric(horizontal: 24.w),

        itemBuilder: (context, index) {
          return CustomOrderItemWidget(
            orderModel: orders[index],
            reOrderIsLoading: reOrderLoading,
            onReorder: () {
              reorder(index);
            },
          );
        },
      ),
    );
  }
}
