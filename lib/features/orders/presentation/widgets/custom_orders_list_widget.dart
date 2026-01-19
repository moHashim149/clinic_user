import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/framework/spaces.dart';
import 'custom_order_item_widget.dart';

class CustomOrdersListWidget extends StatelessWidget {
  const CustomOrdersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => heightSpace(16.h),
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 24.w),

        itemBuilder: (context, index) {
          return CustomOrderItemWidget();
        },
      ),
    );
  }
}
