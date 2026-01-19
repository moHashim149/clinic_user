import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import 'custom_store_item_widget.dart';

class CustomStoresListWidget extends StatelessWidget {
  const CustomStoresListWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
     itemBuilder: (context, index) =>  CustomStoreItemWidget(
        storeName: "store name",
        storeLocation: "location",
        storeImage: AppAssets.testImage,
        avgRating: 4.5,
        ratesNum: 100,
        distance: 10,
        onTap: () {
          context.pushWithNamed(Routes.storeDetailsView);
        },
      ),
      separatorBuilder: (context, index) => heightSpace(16.h),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
    );
  }
}
