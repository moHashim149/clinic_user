import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/framework/spaces.dart';
import '../cubit/women_cubit.dart';
import 'custom_stories_item_widget.dart';

class CustomStoriesWidget extends StatelessWidget {
  final WomenCubit cubit;

  const CustomStoriesWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 153.h,
      child: ListView.separated(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomStoriesItemWidget(
            storeImage: AppAssets.testImage,
            storeName: "store name",
            storeAvgRate: "4.5",
            storyThumbnail: AppAssets.testImage,
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return widthSpace(16.w);
        },
        itemCount: 5,
      ),
    );
  }
}
