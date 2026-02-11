import 'package:brandy_user/features/product_details/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import '../../../product_details/data/arguments/product_details_arguments.dart';
import 'custom_product_item_widget.dart';

class CustomProductsListWidget extends StatelessWidget {
  final List<ProductModel> products;
  final RefreshController refreshController;
  final VoidCallback onLoading, onRefresh,onUpdate;
  const CustomProductsListWidget({
    super.key,
    required this.products,
    required this.refreshController,
    required this.onLoading,
    required this.onRefresh,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onLoading: onLoading,
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        itemBuilder: (context, index) {
          return CustomProductItemWidget(
            image: products[index].image ?? "",
            title: products[index].name,
            desc: products[index].description,
            price: products[index].price ?? 0,
            priceAfterDiscount: products[index].priceAfterDiscount ?? 0,
            cartQuantity: products[index].cartQuantity ?? 0,
            onTap: () {
              context.pushWithNamed(
                Routes.productDetailsView,
                arguments: ProductDetailsArguments(
                  productId: products[index].id,
                  onUpdate: onUpdate
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) {
          return heightSpace(24.h);
        },
        itemCount: products.length,
      ),
    );
  }
}
