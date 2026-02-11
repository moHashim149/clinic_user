import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/di/di.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/helpers/url_launcher_helper.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:brandy_user/core/widgets/custom_button.dart';
import 'package:brandy_user/core/widgets/custom_image_network.dart';
import 'package:brandy_user/features/order_details/presentation/widgets/custom_order_details_summary_widget.dart';
import 'package:brandy_user/features/store_details/presentation/widgets/custom_rounded_icon_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../cart/presentation/widgets/custom_cart_summary_widget.dart';
import '../../data/arguments/order_details_arguments.dart';
import '../cubit/order_details_cubit.dart';
import '../widgets/custom_order_courier_widget.dart';
import '../widgets/custom_order_details_item_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import '../widgets/custom_order_pickup_delivery_widget.dart';

class OrderDetailsView extends StatelessWidget {
  final OrderDetailsArguments args;
  const OrderDetailsView({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.orderDetails.tr()),
      //       persistentFooterButtons: [
      //         BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      //   builder: (context, state) {
      //     final cubit = context.read<OrderDetailsCubit>();
      //     return Container(
      //           decoration: BoxDecoration(
      //             color: AppColors.secondary4Color,
      //             borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))
      //           ),
      //           padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 33.h),
      //           child: CustomButton(onPressed: (){},text: "تتبع الطلب",),
      //         );
      //   },
      // )
      //       ],
      body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          final cubit = context.read<OrderDetailsCubit>();
          if (state is OrderDetailsLoading) {
            return CustomLoading();
          } else if (state is OrderDetailsFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                cubit.fetchOrderDetails(args.orderId);
              },
            );
          } else {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        LocaleKeys.orderNumber.tr(),
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackTextEighthColor,
                        ),
                      ),
                      widthSpace(8.w),
                      Text(
                        cubit.orderModel!.code,
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackTextEighthColor,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 32.h,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          color: cubit.orderModel!.statusKey == 2
                              ? AppColors.primaryColor
                              : cubit.orderModel!.statusKey == 3 ||
                                    cubit.orderModel!.statusKey == 1
                              ? AppColors.yellowColor
                              : cubit.orderModel!.statusKey == 4
                              ? AppColors.successColor
                              : AppColors.redColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            cubit.orderModel!.status,
                            style: AppTextStyles.textStyle10.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondary4Color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  heightSpace(24.h),
                  CustomOrderPickupDeliveryWidget(
                    pickup: cubit.orderModel!.pickup!,
                    delivery: cubit.orderModel!.delivery!,
                  ),
                  if (cubit.orderModel!.courier != null) ...[
                    heightSpace(16.h),
                    CustomOrderCourierWidget(
                      courier: cubit.orderModel!.courier!,
                      isDelivered: cubit.orderModel!.statusKey == 4,
                      chatId: cubit.orderModel!.chatId,
                    ),
                  ],
                  heightSpace(16.h),
                  Text(
                    LocaleKeys.yourOrder.tr(),
                    style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackTextEighthColor,
                    ),
                  ),
                  heightSpace(8.h),
                  ...List.generate(cubit.orderModel!.orderItems.length, (
                    index,
                  ) {
                    return CustomOrderDetailsItemWidget(
                      cartItemModel: cubit.orderModel!.orderItems[index],
                    );
                  }),
                  heightSpace(8.h),
                  CustomCartSummaryWidget(
                    cartTotal: cubit.orderModel!.purchase!.subTotal,
                    deliveryFee: cubit.orderModel!.purchase!.deliveryCost,
                    discount: cubit.orderModel!.purchase!.discount,
                    grandTotal: cubit.orderModel!.purchase!.totalAmount,
                    tax: cubit.orderModel!.purchase!.taxAmount,
                  ),
                  heightSpace(16.h),
                  CustomOrderDetailsSummaryWidget(
                    payMethod: cubit.orderModel!.purchase!.via.label,
                    phone: cubit.orderModel!.user!.phone!,
                    date: cubit.orderModel!.date,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
