import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/framework/spaces.dart';
import '../../../women/presentation/widgets/custom_store_item_widget.dart';

class CustomFavoritesListWidget extends StatelessWidget {
  const CustomFavoritesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CustomStoreItemWidget(
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
      separatorBuilder: (context, index) => heightSpace(24.h),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      itemCount: 10,
    );
  }
}
