import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/features/store_details/data/arguments/store_details_arguments.dart';
import 'package:brandy_user/features/women/data/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import 'custom_best_stores_item_widget.dart';

class CustomBestStoresListWidget extends StatelessWidget {
  final List<StoreModel> stores;
  const CustomBestStoresListWidget({super.key, required this.stores});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stores.length,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 16.h,
          childAspectRatio: 58.h / 232.w,
        ),
        itemBuilder: (context, index) {
          return CustomBestStoresItemWidget(
            storeName: stores[index].name,
            storeImage: stores[index].logo ?? "",
            deliveryCost: stores[index].deliveryCost ?? "",
            time: stores[index].deliveryTime ?? "",
            onTap: () {
              context.pushWithNamed(
                Routes.storeDetailsView,
                arguments: StoreDetailsArguments(storeId: stores[index].id),
              );
            },
          );
        },
      ),
    );
  }
}
