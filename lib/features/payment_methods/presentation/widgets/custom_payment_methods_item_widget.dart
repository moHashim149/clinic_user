import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/core/widgets/custom_image_network.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_radio_button.dart';

class CustomPaymentMethodsItemWidget extends StatelessWidget {
  final String title, icon;
  final num? balance;
  final VoidCallback onTap;
  final bool isActive;
  const CustomPaymentMethodsItemWidget({
    super.key,
    required this.title,
    required this.icon,
    this.balance,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          CustomImageNetwork(image: icon, widthImage: 24.w, heightImage: 24.h),
          widthSpace(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                heightSpace(8.h),
                if (balance != null)
                  Row(
                    children: [
                      Text(
                        LocaleKeys.yourBalanceAmount.tr(
                          namedArgs: {'amount': balance!.toString()},
                        ),
                        style: AppTextStyles.textStyle10.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackTextTenthColor,
                        ),
                      ),
                      SvgPicture.asset(
                        AppAssets.currency,
                        width: 13.w,
                        height: 14.h,
                        color: AppColors.blackTextTenthColor,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          CustomRadioButton(isActive: isActive),
        ],
      ).onTap(function: onTap),
    );
  }
}
