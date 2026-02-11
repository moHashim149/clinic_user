import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/features/addresses/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_address_item_widget.dart';

class CustomAddressListWidget extends StatelessWidget {
  final List<AddressModel> addresses;
  final VoidCallback onUpdate;

  const CustomAddressListWidget({super.key, required this.addresses, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          CustomAddressItemWidget(addressModel: addresses[index],onUpdate: onUpdate,),
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Divider(thickness: 0.5.w, color: AppColors.strokeColor),
        );
      },
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      itemCount: addresses.length,
    );
  }
}
