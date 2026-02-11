import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/custom_image_network.dart';
import '../../../../core/widgets/custom_visitor_widget.dart';
import '../../../auth/data/models/user_model.dart';

class CustomHeaderWidget extends StatelessWidget {
  final UserModel? userModel;
  final String? address;

  const CustomHeaderWidget({super.key, this.userModel, this.address});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          if (userModel != null) ...[
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 0.42.w,
                ),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(1.5.r),
                child: CustomImageNetwork(
                  image: userModel?.image ?? "",
                  heightImage: 41.h,
                  widthImage: 37.w,
                  radiusValue: 20.r,
                ),
              ),
            ),
            widthSpace(12.w),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel?.name ?? LocaleKeys.guestCustomer.tr(),
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (address != null) ...[
                  heightSpace(2.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          address!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.textStyle10.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackTextEighthColor,
                          ),
                        ),
                      ),
                      widthSpace(3.5.w),
                      SvgPicture.asset(AppAssets.arrowDown),
                    ],
                  ),
                ],
              ],
            ),
          ),
          widthSpace(4.w),
          Container(
            width: 40.w,
            height: 40.h,
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.strokeColor),
            ),
            clipBehavior: Clip.none,
            child: SvgPicture.asset(AppAssets.heart),
          ).onTap(
            function: () {
              if (userModel != null) {
                context.pushWithNamed(Routes.favoritesView);
              } else {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                  ),
                  builder: (context) {
                    return CustomVisitorWidget();
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
