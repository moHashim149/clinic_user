import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:brandy_user/core/widgets/custom_empty_data_widget.dart';
import 'package:brandy_user/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:brandy_user/features/cart/presentation/widgets/custom_cart_coupon_field_widget.dart';
import 'package:brandy_user/features/cart/presentation/widgets/custom_cart_item_widget.dart';
import 'package:brandy_user/features/cart/presentation/widgets/custom_cart_notes_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import '../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../widgets/custom_cart_address_widget.dart';
import '../widgets/custom_cart_pay_widget.dart';
import '../widgets/custom_cart_privacy_widget.dart';
import '../widgets/custom_cart_summary_widget.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.cartTitle.tr()),
      persistentFooterDecoration: BoxDecoration(),
      persistentFooterButtons: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cubit = context.read<CartCubit>();
            if (cubit.cartModel?.orderItems.isNotEmpty ?? false) {
              return CustomCartPayWidget(
                locationId: cubit.addresses.firstOrNull?.id ?? 0,
                couponCode: cubit.couponController.text.isEmpty
                    ? null
                    : cubit.couponController.text,
                total: cubit.calculateTotal(
                  cubit.cartModel!.itemsTotal,
                  cubit.cartModel!.deliveryCost,
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          if (state is CartLoading) {
            return CustomLoading();
          } else if (state is CartFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                cubit.fetchCart();
              },
            );
          } else {
            return cubit.cartModel!.orderItems.isNotEmpty
                ? SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      vertical: 30.h,
                      horizontal: 24.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCartAddressWidget(
                          addressModel: cubit.addresses.first,
                        ),
                        heightSpace(24.h),
                        ...List.generate(
                          cubit.cartModel!.orderItems.length,
                          (index) => CustomCartItemWidget(
                            cartItemModel: cubit.cartModel!.orderItems[index],
                            plusOnTap: () {
                              cubit.updateCart(
                                cubit.cartModel!.orderItems[index],
                                true,
                              );
                            },
                            minusOnTap: () {
                              cubit.updateCart(
                                cubit.cartModel!.orderItems[index],
                                false,
                              );
                            },
                            deleteOnTap: () {
                              cubit.deleteCart(
                                cubit.cartModel!.orderItems[index],
                                context,
                              );
                            },
                          ),
                        ),
                        heightSpace(12.h),
                        CustomCartCouponFieldWidget(
                          controller: cubit.couponController,
                          isCouponApplied: cubit.couponModel != null,
                          isLoading: state is CheckCouponLoading,
                          onTap: () {
                            if (cubit.couponModel == null) {
                              cubit.checkCoupon();
                            } else {
                              cubit.clearCoupon();
                            }
                          },
                        ),
                        heightSpace(24.h),
                        CustomCartSummaryWidget(
                          cartTotal: cubit.cartModel!.itemsTotal,
                          deliveryFee: cubit.cartModel!.deliveryCost,
                          discount:
                              cubit.calculateDiscountValue(
                                cubit.cartModel!.itemsTotal,
                              ) ??
                              0,
                          grandTotal: cubit.calculateTotal(
                            cubit.cartModel!.itemsTotal,
                            cubit.cartModel!.deliveryCost,
                          ),
                        ),
                        heightSpace(24.h),
                        CustomCartPrivacyWidget(),
                        heightSpace(24.h),
                        CustomCartNotesWidget(notesCtrl: cubit.notesController),
                      ],
                    ),
                  )
                : CustomEmptyDataWidget(text: LocaleKeys.emptyCart.tr());
          }
        },
      ),
    );
  }
}
