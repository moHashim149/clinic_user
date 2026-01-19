import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/util/extensions/media_query.dart';
import '../../../../../core/widgets/custom_image_network.dart';
import '../cubit/women_cubit.dart';

class CustomSliderAndIndicatorWidget extends StatelessWidget {
  final WomenCubit cubit;

  const CustomSliderAndIndicatorWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(

            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              cubit.changePageIndex(index);
            },
            aspectRatio: 3 / 1,
            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            padEnds: false,
            initialPage: cubit.currentPage,
            autoPlay: true,
          ),
          items: List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsetsDirectional.only(start: cubit.currentPage == index ? 24.w : 0,end: 16.w),
              child: CustomImageNetwork(
                image: AppAssets.testImage,
                widthImage: context.width,
                heightImage: 124.h,
                radiusValue: 24.r,
              ),
            ),
          ),
        ),
        heightSpace(20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              height: cubit.currentPage == index ? 12.h : 6.h,
              width: cubit.currentPage == index ? 12.w : 6.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cubit.currentPage == index
                    ? AppColors.primaryColor
                    : AppColors.whiteOpacityColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
