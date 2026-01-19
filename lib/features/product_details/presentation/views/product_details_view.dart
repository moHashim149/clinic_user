import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/media_query.dart';
import 'package:brandy_user/core/widgets/custom_button.dart';
import 'package:brandy_user/core/widgets/custom_image_network.dart';
import 'package:brandy_user/features/product_details/presentation/widgets/custom_colors_list_widget.dart';
import 'package:brandy_user/features/product_details/presentation/widgets/custom_sizes_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../store_details/presentation/widgets/custom_rounded_icon_widget.dart';
import '../cubit/product_details_cubit.dart';
import '../widgets/custom_add_to_cart_widget.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        CustomAddToCartWidget()
      ],
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          final cubit = context.read<ProductDetailsCubit>();
          if (state is ProductDetailsLoading) {
            return CustomLoading();
          } else if (state is ProductDetailsFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                // cubit.fetchHome();
              },
            );
          } else {
            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: CustomRoundedIconWidget(
                        icon: AppAssets.close,
                        onTap: () {
                          context.pop();
                        },
                        borderColor: AppColors.primaryColor,
                      ),
                    ),
                    heightSpace(8.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: CustomImageNetwork(
                        image: AppAssets.testImage,
                        heightImage: 384.h,
                        widthImage: context.width,
                        radiusValue: 16.r,
                      ),
                    ),
                    heightSpace(24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        "بالطو بناتيطويل",
                        style: AppTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        "معطف أنيق اسود طويل بكم صوف، خريف/ شتاء",
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.grayColor,
                        ),
                      ),
                    ),
                    heightSpace(24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        "اللون: لون كحلي",
                        style: AppTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    heightSpace(16.h),
                    CustomColorsListWidget(),
                    heightSpace(24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Text(
                        "المقاس",
                        style: AppTextStyles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    heightSpace(16.h),
                    CustomSizesListWidget(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
