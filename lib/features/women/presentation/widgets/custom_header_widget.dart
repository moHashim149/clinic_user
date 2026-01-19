import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/widgets/custom_image_network.dart';

class CustomHeaderWidget extends StatelessWidget {
  // final UserModel? userModel;

  const CustomHeaderWidget({
    super.key,
    // required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor, width: 0.42.w),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(1.5.r),
              child: CustomImageNetwork(
                image: "",
                heightImage: 41.h,
                widthImage: 37.w,
                radiusValue: 20.r,
              ),
            ),
          ),
          widthSpace(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nawaf Fadil",
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                heightSpace(2.h),
                Row(
                  children: [
                    Text(
                      "256986 شارع عبد العزيز، الرياض، المملكة......",
                      style: AppTextStyles.textStyle10.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackTextEighthColor,
                      ),
                    ),
                    widthSpace(3.5.w),
                    SvgPicture.asset(AppAssets.arrowDown),
                  ],
                ),
              ],
            ),
          ),
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
          ).onTap(function: (){
            context.pushWithNamed(Routes.favoritesView);
          }),
        ],
      ),
    );
  }
}
