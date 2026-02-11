import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/features/women/data/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/framework/spaces.dart';
import '../cubit/women_cubit.dart';
import 'custom_categories_item_widget.dart';

class CustomCategoriesWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  const CustomCategoriesWidget({super.key, required this.categories});

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
            categoryImage: categories[index].image,
            categoryName: categories[index].name,
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return widthSpace(16.w);
        },
        itemCount: categories.length,
      ),
    );
  }
}
