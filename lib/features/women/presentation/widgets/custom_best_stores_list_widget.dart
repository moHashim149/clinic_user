import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import 'custom_best_stores_item_widget.dart';

class CustomBestStoresListWidget extends StatelessWidget {
  const CustomBestStoresListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 16.h,
          childAspectRatio: 58.h / 232.w,
        ),
        itemBuilder: (context, index) {
          return CustomBestStoresItemWidget(
            storeName: "store name",
            storeImage: AppAssets.testImage,
            delivery: "مجاناً",
            time: "15 دقيقة",
            onTap: () {
              context.pushWithNamed(Routes.storeDetailsView);
            },
          );
        },
      ),
    );
  }
}
