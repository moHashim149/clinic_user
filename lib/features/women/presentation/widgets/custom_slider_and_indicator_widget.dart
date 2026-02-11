import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/features/women/data/models/banner_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/util/extensions/media_query.dart';
import '../../../../../core/widgets/custom_image_network.dart';
import '../cubit/women_cubit.dart';

class CustomSliderAndIndicatorWidget extends StatelessWidget {
  final List<BannerModel> banners;
  final Function(int index, CarouselPageChangedReason reason) onPageChanged;
  final int currentPage;

  const CustomSliderAndIndicatorWidget({super.key, required this.banners, required this.onPageChanged, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            onPageChanged: onPageChanged,
            aspectRatio: 3 / 1,
            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            padEnds: false,
            initialPage: currentPage,
            autoPlay: true,
          ),
          items: List.generate(
            banners.length,
            (index) => Padding(
              padding: EdgeInsetsDirectional.only(start: currentPage == index ? 24.w : 0,end: 16.w),
              child: CustomImageNetwork(
                image: banners[index].image,
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
            banners.length,
            (index) => Container(
              height: currentPage == index ? 12.h : 6.h,
              width: currentPage == index ? 12.w : 6.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index
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
