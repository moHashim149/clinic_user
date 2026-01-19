import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../core/di/di.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../women/presentation/cubit/women_cubit.dart';
import '../../../women/presentation/widgets/custom_best_stores_list_widget.dart';
import '../../../women/presentation/widgets/custom_categories_widget.dart';
import '../../../women/presentation/widgets/custom_header_widget.dart';
import '../../../women/presentation/widgets/custom_search_widget.dart';
import '../../../women/presentation/widgets/custom_slider_and_indicator_widget.dart';
import '../../../women/presentation/widgets/custom_stores_list_widget.dart';
import '../../../women/presentation/widgets/custom_stories_widget.dart';


class ChildView extends StatelessWidget {
  const ChildView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WomenCubit>(),
      child: Scaffold(
        body: BlocBuilder<WomenCubit, WomenState>(
          builder: (context, state) {
            final cubit = context.read<WomenCubit>();
            if (state is DataLoading) {
              return CustomLoading();
            } else if (state is DataFailure) {
              return CustomError(
                error: state.error,
                retry: () {
                  // cubit.fetchHome();
                },
              );
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomHeaderWidget(),
                      heightSpace(16.h),
                      CustomSearchWidget(
                        readOnly: true,
                        onSearchTap: () {
                          context.pushWithNamed(Routes.searchView);
                        },
                      ),
                      heightSpace(20.h),
                      CustomStoriesWidget(cubit: cubit),
                      heightSpace(32.h),
                      CustomSliderAndIndicatorWidget(cubit: cubit),
                      heightSpace(24.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "اكتشفِ الاقسام",
                              style: AppTextStyles.textStyle16.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackTextEighthColor,
                              ),
                            ),
                            Text(
                              "عرض المزيد",
                              style: AppTextStyles.textStyle12.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      heightSpace(14.h),
                      CustomCategoriesWidget(cubit: cubit),
                      heightSpace(22.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          "أشهر المتاجر النسائية",
                          style: AppTextStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackTextEighthColor,
                          ),
                        ),
                      ),
                      heightSpace(12.h),
                      CustomBestStoresListWidget(),
                      heightSpace(32.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          "متاجر الأطفال",
                          style: AppTextStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackTextEighthColor,
                          ),
                        ),
                      ),
                      heightSpace(16.h),
                      CustomStoresListWidget(),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
