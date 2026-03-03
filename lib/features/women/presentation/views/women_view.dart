import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../core/di/di.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/custom_visitor_widget.dart';
import '../../../auth/presentation/views/create_service_provider_account_imports.dart';
import '../cubit/women_cubit.dart';
import '../widgets/custom_best_stores_list_widget.dart';
import '../widgets/custom_categories_widget.dart';
import '../widgets/custom_header_widget.dart';
import '../widgets/custom_slider_and_indicator_widget.dart';
import '../widgets/custom_stores_list_widget.dart';
import '../widgets/custom_stories_widget.dart';

class WomenView extends StatelessWidget {
  const WomenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WomenCubit>()..fetchHome(1),
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
                  cubit.fetchHome(1);
                },
              );
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomHeaderWidget(
                        userModel: cubit.userModel,
                        address: cubit.currentLocation,
                      ),
                      // GestureDetector(
                      //   onTap: () => Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => CreateAccount(),
                      //     ),
                      //   ),
                      //   child: Container(
                      //     width: 50,
                      //     height: 50,
                      //     color: AppColors.blueColor,
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateServiceProviderAccount(),
                          ),
                        ),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: AppColors.blackColor,
                        ),
                      ),
                      // heightSpace(16.h),
                      // CustomSearchWidget(
                      //   readOnly: true,
                      //   onSearchTap: () {
                      //     context.pushWithNamed(Routes.searchView);
                      //   },
                      // ),
                      heightSpace(20.h),
                      CustomStoriesWidget(
                        stores: cubit.homeModel!.storeStories,
                      ),
                      heightSpace(32.h),
                      CustomSliderAndIndicatorWidget(
                        banners: cubit.homeModel!.banners,
                        currentPage: cubit.currentPage,
                        onPageChanged: (index, reason) {
                          cubit.changePageIndex(index);
                        },
                      ),
                      heightSpace(24.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          LocaleKeys.discoverSections.tr(),
                          style: AppTextStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackTextEighthColor,
                          ),
                        ),
                      ),
                      heightSpace(14.h),
                      CustomCategoriesWidget(
                        categories: cubit.homeModel!.categories,
                      ),
                      heightSpace(22.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          LocaleKeys.famousWomenStores.tr(),
                          style: AppTextStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackTextEighthColor,
                          ),
                        ),
                      ),
                      heightSpace(12.h),
                      CustomBestStoresListWidget(
                        stores: cubit.homeModel!.featuredStores,
                      ),
                      heightSpace(32.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          LocaleKeys.womenStores.tr(),
                          style: AppTextStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackTextEighthColor,
                          ),
                        ),
                      ),
                      heightSpace(16.h),
                      CustomStoresListWidget(
                        stores: cubit.homeModel!.nearbyStores,
                        onFavTap: (index) {
                          if (cubit.userModel != null) {
                            cubit.favStore(
                              cubit.homeModel!.nearbyStores[index],
                            );
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
