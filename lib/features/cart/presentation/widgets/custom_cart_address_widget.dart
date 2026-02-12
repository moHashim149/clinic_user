import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/features/addresses/data/arguments/select_address_argument.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../addresses/data/models/address_model.dart';

class CustomCartAddressWidget extends StatelessWidget {
  final AddressModel? addressModel;
  final VoidCallback onUpdate;
  const CustomCartAddressWidget({super.key, required this.addressModel, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 12.w,
        end: 23.w,
        top: 12.h,
        bottom: 36.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.secondary4Color,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(AppAssets.navigate),
              widthSpace(10.w),
              Expanded(
                child: Text(
                  addressModel?.name ?? LocaleKeys.addNewAddress.tr(),
                  style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SvgPicture.asset(
                AppAssets.arrowDown,
                width: 19.w,
                height: 20.h,
              ),
            ],
          ),
          Text(
            addressModel?.location ?? "",
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.hintColor,
            ),
          ),
        ],
      ),
    ).onTap(function: (){
      if(addressModel == null){
        context.pushWithNamed(Routes.selectAddressView,arguments: SelectAddressArgument(onUpdate: onUpdate));
      }
    });
  }
}
