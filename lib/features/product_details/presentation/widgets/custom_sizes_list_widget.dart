import 'package:brandy_user/features/product_details/data/models/available_size_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/framework/spaces.dart';
import 'custom_sizes_item_widget.dart';

class CustomSizesListWidget extends StatelessWidget {
  final List<AvailableSizeModel> sizes;
  final void Function(int index) onSelectSize;
  final int currentSize;
  const CustomSizesListWidget({
    super.key,
    required this.sizes,
    required this.onSelectSize,
    required this.currentSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        itemBuilder: (context, index) {
          return CustomSizesItemWidget(
            size: sizes[index].sizeName,
            isSelected: currentSize == index,
            onTap: () {
              onSelectSize.call(index);
            },
          );
        },
        separatorBuilder: (context, index) {
          return widthSpace(10.w);
        },
        itemCount: sizes.length,
      ),
    );
  }
}
