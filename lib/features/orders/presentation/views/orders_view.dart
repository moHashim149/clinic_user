import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/di/di.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/media_query.dart';
import 'package:brandy_user/core/widgets/custom_button.dart';
import 'package:brandy_user/core/widgets/custom_image_network.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_empty_data_widget.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/custom_order_item_widget.dart';
import '../widgets/custom_orders_header_widget.dart';
import '../widgets/custom_orders_list_widget.dart';
import '../widgets/custom_orders_tab_widget.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>()..fetchOrders(),
      child: Scaffold(
        body: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            final cubit = context.read<OrdersCubit>();

            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightSpace(24.h),
                  CustomOrdersHeaderWidget(),
                  heightSpace(32.h),
                  CustomOrdersTabWidget(
                    onTap: (index) {
                      cubit.fetchOrders(status: OrderStatus.values[index].id);
                    },
                  ),
                  heightSpace(28.h),
                  Expanded(
                    child: state is OrdersLoading
                        ? CustomLoading()
                        : state is OrdersFailure
                        ? CustomError(
                            error: state.error,
                            retry: () {
                              cubit.fetchOrders();
                            },
                          )
                        : cubit.orders.isNotEmpty
                        ? CustomOrdersListWidget(
                            orders: cubit.orders,
                            refreshController: cubit.refreshController,
                            onRefresh: () {
                              cubit.refreshOrders();
                            },
                            onLoading: () {
                              cubit.paginateOrders();
                            },
                            reorder: (index) {
                              cubit.reOrder(cubit.orders[index].id,context);
                            },
                            reOrderLoading: state is ReOrderLoading,
                          )
                        : CustomEmptyDataWidget(
                            text: LocaleKeys.emptyOrders.tr(),
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
