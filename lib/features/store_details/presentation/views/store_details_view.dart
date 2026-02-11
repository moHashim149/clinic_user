import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/features/store_details/data/arguments/store_details_arguments.dart';
import 'package:brandy_user/features/store_details/presentation/widgets/custom_cart_count_widget.dart';
import 'package:brandy_user/features/store_details/presentation/widgets/custom_products_list_widget.dart';
import 'package:brandy_user/features/store_details/presentation/widgets/custom_store_header_widget.dart';
import 'package:brandy_user/features/store_details/presentation/widgets/custom_tab_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_visitor_widget.dart';
import '../cubit/store_details_cubit.dart';

class StoreDetailsView extends StatelessWidget {
  final StoreDetailsArguments storeDetailsArguments;

  const StoreDetailsView({super.key, required this.storeDetailsArguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterDecoration: BoxDecoration(),
      persistentFooterButtons: [
        BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
          builder: (context, state) {
            var cubit = context.read<StoreDetailsCubit>();
            if ((cubit.cartModel?.orderItems.isNotEmpty ?? false) && cubit.token != null) {
              return CustomCartCountWidget(
                count: cubit.cartModel!.orderItems.length,
                totalPrice: cubit.cartModel!.itemsTotal,
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
      body: BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
        builder: (context, state) {
          final cubit = context.read<StoreDetailsCubit>();
          if (state is StoreDetailsLoading) {
            return CustomLoading();
          } else if (state is StoreDetailsFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                cubit.fetchStoreDetails(storeDetailsArguments.storeId);
              },
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomStoreHeaderWidget(
                  storeModel: cubit.storeDetailsModel!.store,
                  onFavTap: () {
                    if (cubit.token != null) {
                      cubit.favStore();
                    } else {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24.r),
                          ),
                        ),
                        builder: (context) {
                          return CustomVisitorWidget();
                        },
                      );
                    }
                  },
                ),
                heightSpace(132.h),
                SizedBox(
                  height: 36.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    separatorBuilder: (context, index) {
                      return widthSpace(12.w);
                    },
                    itemBuilder: (context, index) {
                      return CustomTabItemWidget(
                        isActive: cubit.currentSectionIndex == index,
                        title: cubit.storeDetailsModel!.sections[index].name,
                        onTap: () {
                          cubit.changeSectionIndex(index);
                        },
                      );
                    },
                    itemCount: cubit.storeDetailsModel!.sections.length,
                  ),
                ),
                heightSpace(24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    cubit
                        .storeDetailsModel!
                        .sections[cubit.currentSectionIndex]
                        .name,
                    style: AppTextStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: state is SectionProductsLoading
                      ? CustomLoading()
                      : state is SectionProductsFailure
                      ? CustomError(
                          error: state.message,
                          retry: () {
                            cubit.fetchSectionProducts();
                          },
                        )
                      : cubit.products.isNotEmpty
                      ? CustomProductsListWidget(
                          products: cubit.products,
                          refreshController: cubit.refreshController,
                          onLoading: () {
                            cubit.paginateSectionProducts();
                          },
                          onRefresh: () {
                            cubit.refreshSectionProducts();
                          },
                          onUpdate: () {
                            cubit.fetchCart();
                          },
                        )
                      : SizedBox(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
