import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/core/widgets/custom_button.dart';
import 'package:brandy_user/features/store_details/presentation/widgets/custom_cart_count_widget.dart';
import 'package:brandy_user/features/store_details/presentation/widgets/custom_product_item_widget.dart';
import 'package:brandy_user/features/store_details/presentation/widgets/custom_store_header_widget.dart';
import 'package:brandy_user/features/store_details/presentation/widgets/custom_tab_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../cubit/store_details_cubit.dart';

class StoreDetailsView extends StatelessWidget {
  const StoreDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [CustomCartCountWidget()],
      body: BlocBuilder<StoreDetailsCubit, StoreDetailsState>(
        builder: (context, state) {
          final cubit = context.read<StoreDetailsCubit>();
          if (state is StoreDetailsLoading) {
            return CustomLoading();
          } else if (state is StoreDetailsFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                // cubit.fetchHome();
              },
            );
          } else {
            return Column(
              children: [
                CustomStoreHeaderWidget(),
                heightSpace(132.h),
                Expanded(
                  child: ScrollableListTabScroller.defaultComponents(
                    tabBarProps: TabBarProps(
                      dividerHeight: 0,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                    ),
                    itemCount: 10,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    tabBuilder:
                        (BuildContext context, int index, bool isActive) =>
                            CustomTabItemWidget(
                              isActive: isActive,
                              title: "بلوزة",
                            ),
                    itemBuilder: (BuildContext context, int index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        heightSpace(24.h),
                        Text(
                          "بلوزة",
                          style: AppTextStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        heightSpace(12.h),
                        ...List.generate(10, (index) {
                          return CustomProductItemWidget(
                            onTap: () {
                              context.pushWithNamed(Routes.productDetailsView);
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
