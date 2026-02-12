import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:brandy_user/core/widgets/custom_empty_data_widget.dart';
import 'package:brandy_user/core/widgets/custom_toast.dart';
import 'package:brandy_user/features/cart/data/arguments/cart_arguments.dart';
import 'package:brandy_user/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:brandy_user/features/cart/presentation/widgets/custom_cart_coupon_field_widget.dart';
import 'package:brandy_user/features/cart/presentation/widgets/custom_cart_item_widget.dart';
import 'package:brandy_user/features/cart/presentation/widgets/custom_cart_notes_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import '../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../payment_methods/data/data_source/arguments/payment_methods_arguments.dart';
import '../widgets/custom_cart_address_widget.dart';
import '../widgets/custom_cart_pay_widget.dart';
import '../widgets/custom_cart_privacy_widget.dart';
import '../widgets/custom_cart_summary_widget.dart';

class CartView extends StatelessWidget {
  final CartArguments cartArguments;
  const CartView({super.key, required this.cartArguments});

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
                onTap: () {
                  if (cubit.addresses.isNotEmpty) {
                    context.pushWithNamed(
                      Routes.paymentMethodsView,
                      arguments: PaymentMethodsArguments(
                        locationId: cubit.addresses.firstOrNull?.id ?? 0,
                        total: cubit.calculateTotal(
                          cubit.cartModel!.itemsTotal,
                          cubit.cartModel!.deliveryCost,
                        ),
                        couponCode: cubit.couponController.text.isEmpty
                            ? null
                            : cubit.couponController.text,
                      ),
                    );
                  } else {
                    showToast(
                      text: LocaleKeys.youMustAddAddress.tr(),
                      state: ToastStates.error,
                    );
                  }
                },
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
                          addressModel: cubit.addresses.firstOrNull,
                          onUpdate: () {
                            cubit.fetchCart();
                          },
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
                                  cartArguments.onUpdate
                              );
                            },
                            minusOnTap: () {
                              cubit.updateCart(
                                cubit.cartModel!.orderItems[index],
                                false,
                                cartArguments.onUpdate
                              );
                            },
                            deleteOnTap: () {
                              cubit.deleteCart(
                                cubit.cartModel!.orderItems[index],
                                context,
                                  cartArguments.onUpdate
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
