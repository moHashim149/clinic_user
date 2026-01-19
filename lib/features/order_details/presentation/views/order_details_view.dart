import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/di/di.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:brandy_user/core/widgets/custom_button.dart';
import 'package:brandy_user/core/widgets/custom_image_network.dart';
import 'package:brandy_user/features/store_details/presentation/widgets/custom_rounded_icon_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../cart/presentation/widgets/custom_cart_summary_widget.dart';
import '../cubit/order_details_cubit.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrderDetailsCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: "تفاصيل الطلب"),
        persistentFooterButtons: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.secondary4Color,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 33.h),
            child: CustomButton(onPressed: (){},text: "تتبع الطلب",),
          )
        ],
        body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            final cubit = context.read<OrderDetailsCubit>();
            if (state is OrderDetailsLoading) {
              return CustomLoading();
            } else if (state is OrderDetailsFailure) {
              return CustomError(
                error: state.error,
                retry: () {
                  // cubit.fetchHome();
                },
              );
            } else {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "رقم الطلب",
                          style: AppTextStyles.textStyle12.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackTextEighthColor,
                          ),
                        ),
                        widthSpace(8.w),
                        Text(
                          "#589d58vb8b",
                          style: AppTextStyles.textStyle12.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackTextEighthColor,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: 32.h,
                          width: 93.w,
                          decoration: BoxDecoration(
                            color: AppColors.successColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: Text(
                              "مكتمل",
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
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondary4Color,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      padding: EdgeInsets.only(
                        top: 14.h,
                        left: 12.w,
                        right: 12.w,
                        bottom: 16.h,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(
                                AppAssets.location,
                                width: 20.w,
                                height: 20.h,
                              ),
                              DottedLine(
                                direction: Axis.vertical,
                                lineLength: 65.h,
                                dashColor: AppColors.strokeColor,
                              ),
                              SvgPicture.asset(
                                AppAssets.location,
                                width: 20.w,
                                height: 20.h,
                              ),
                            ],
                          ),
                          widthSpace(8.h),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Zara",
                                  style: AppTextStyles.textStyle12.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                heightSpace(4.h),
                                Text(
                                  "شارع الملك عبدالعزيز، الرياض، المملكة العربية السعودية",
                                  style: AppTextStyles.textStyle10.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.hintColor,
                                  ),
                                ),
                                heightSpace(50.h),
                                Text(
                                  "Zara",
                                  style: AppTextStyles.textStyle12.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                heightSpace(4.h),
                                Text(
                                  "شارع الملك عبدالعزيز، الرياض، المملكة العربية السعودية",
                                  style: AppTextStyles.textStyle10.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.hintColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    heightSpace(16.h),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondary4Color,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      padding: EdgeInsetsDirectional.only(
                        top: 22.h,
                        start: 12.w,
                        end: 16.w,
                        bottom: 22.h,
                      ),
                      child: Row(
                        children: [
                          CustomImageNetwork(image: AppAssets.testImage,radiusValue: 23.r,heightImage: 46.h,widthImage: 46.w,),
                          widthSpace(11.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "مسعود عبدالعزيز",
                                  style: AppTextStyles.textStyle10.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                heightSpace(2.h),
                                Text(
                                  "masoud@gmail.com",
                                  style: AppTextStyles.textStyle10.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          widthSpace(4.w),
                         CustomRoundedIconWidget(icon: AppAssets.call, onTap: (){},color: AppColors.transparentColor,padding: 8.r,),
                          widthSpace(8.w),
                          CustomRoundedIconWidget(icon: AppAssets.chat, onTap: (){},color: AppColors.transparentColor,padding: 8.r,),

                        ],
                      ),
                    ),
                    heightSpace(16.h),
                    Text("طلبك",style: AppTextStyles.textStyle12.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackTextEighthColor
                    ),),
                    heightSpace(8.h),
                    ...List.generate(2, (index) {
                      return   Container(
                        decoration: BoxDecoration(
                          color: AppColors.secondary4Color,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h
                        ),
                        margin: EdgeInsets.only(
                          bottom: 16.h
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Zara",
                                    style: AppTextStyles.textStyle14.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.blackTextEighthColor
                                    ),
                                  ),
                                  heightSpace(7.h),
                                  Row(
                                    children: [
                                      Text(
                                        "500",
                                        style: AppTextStyles.textStyle12.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      widthSpace(7.w),
                                      SvgPicture.asset(AppAssets.currency,width: 14.w,height: 16.h)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            widthSpace(4.w),
                            Text(
                              "2 X",
                              style: AppTextStyles.textStyle12.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackTextEighthColor
                              ),
                            ),
                            widthSpace(7.w),
                            CustomImageNetwork(image: AppAssets.testImage,radiusValue: 8.r,heightImage: 62.h,widthImage: 73.w,),

                          ],
                        ),
                      );
                    },),
                    heightSpace(8.h),
                    CustomCartSummaryWidget(),
                    heightSpace(16.h),
                    CustomCartSummaryWidget()


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
