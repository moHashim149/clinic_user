import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/features/women/data/models/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import '../../../store_details/data/arguments/store_details_arguments.dart';
import 'custom_store_item_widget.dart';

class CustomStoresListWidget extends StatelessWidget {
  final List<StoreModel> stores;
  final void Function(int index) onFavTap;
  const CustomStoresListWidget({
    super.key,
    required this.stores,
    required this.onFavTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => CustomStoreItemWidget(
        storeName: stores[index].name,
        storeLocation: stores[index].location ?? "",
        storeImage: stores[index].logo ?? "",
        avgRating: stores[index].rating ?? 0,
        ratesNum: stores[index].ratingsCount ?? 0,
        isFav: stores[index].isFav ?? false,
        distance: stores[index].distance ?? 0,
        onFavTap: () {
          onFavTap.call(index);
        },
        onTap: () {
          context.pushWithNamed(
            Routes.storeDetailsView,
            arguments: StoreDetailsArguments(storeId: stores[index].id),
          );
        },
      ),
      separatorBuilder: (context, index) => heightSpace(16.h),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      physics: NeverScrollableScrollPhysics(),
      itemCount: stores.length,
    );
  }
}
