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
import '../../../../../core/widgets/custom_error.dart';
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
      create: (context) => getIt<OrdersCubit>(),
      child: Scaffold(
        body: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            final cubit = context.read<OrdersCubit>();
            if (state is OrdersLoading) {
              return CustomLoading();
            } else if (state is OrdersFailure) {
              return CustomError(
                error: state.error,
                retry: () {
                  // cubit.fetchHome();
                },
              );
            } else {
              return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace(24.h),
                    CustomOrdersHeaderWidget(),
                    heightSpace(32.h),
                    CustomOrdersTabWidget(),
                    heightSpace(28.h),
                    CustomOrdersListWidget(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
