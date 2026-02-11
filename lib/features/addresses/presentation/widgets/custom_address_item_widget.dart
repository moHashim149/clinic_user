import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/features/addresses/data/arguments/select_address_argument.dart';
import 'package:brandy_user/features/addresses/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/util/extensions/on_tap.dart';

class CustomAddressItemWidget extends StatelessWidget {
  final AddressModel addressModel;
  final VoidCallback onUpdate;
  const CustomAddressItemWidget({super.key, required this.addressModel, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                addressModel.name,
                style: AppTextStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              heightSpace(8.h),
              Text(
                addressModel.location,
                style: AppTextStyles.textStyle12.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SvgPicture.asset(AppAssets.arrowForward)
      ],
    ).onTap(
      function: () {
        context.pushWithNamed(Routes.selectAddressView,arguments: SelectAddressArgument(
          addressModel: addressModel,
          onUpdate: onUpdate
        ));

      },
    );
  }
}
