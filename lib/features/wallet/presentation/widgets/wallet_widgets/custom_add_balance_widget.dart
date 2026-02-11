import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/features/wallet/data/arguments/charge_wallet_argument.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:svg_image_provider/svg_image_provider.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/extensions/media_query.dart';
import '../../../../../core/widgets/custom_button.dart';

class CustomAddBalanceWidget extends StatelessWidget {
  final num balance;
  final Function() onUpdate;

  const CustomAddBalanceWidget({
    super.key,
    required this.balance,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: SvgImageProvider(AppAssets.addBalanceBackground),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 8.h, bottom: 17.h),
      child: Column(
        children: [
          Text(
            LocaleKeys.yourCurrentBalance.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          heightSpace(6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$balance",
                style: AppTextStyles.textStyle24.copyWith(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              widthSpace(6.w),
              SvgPicture.asset(
                AppAssets.currency,
                color: AppColors.whiteColor,
                width: 21.w,
                height: 24.h,
              ),
            ],
          ),
          heightSpace(18.h),
          CustomButton(
            onPressed: () {
              context.pushWithNamed(
                Routes.chargeWalletView,
                arguments: ChargeWalletArgument(onUpdate: onUpdate),
              );
            },
            width: 173.w,
            height: 36.h,
            text: LocaleKeys.chargeBalance.tr(),
            backgroundColor: AppColors.secondary3Color,
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
