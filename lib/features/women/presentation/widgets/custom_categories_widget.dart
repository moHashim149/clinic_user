import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/framework/spaces.dart';
import '../cubit/women_cubit.dart';
import 'custom_categories_item_widget.dart';

class CustomCategoriesWidget extends StatelessWidget {
  final WomenCubit cubit;

  const CustomCategoriesWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 89.h,
      child: ListView.separated(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomCategoriesItemWidget(
            categoryImage: AppAssets.testImage,
            categoryName: "فساتين",
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return widthSpace(16.w);
        },
        itemCount: 10,
      ),
    );
  }
}
