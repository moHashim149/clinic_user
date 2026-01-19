import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_shadows.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/media_query.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/widgets/custom_image_network.dart';
import 'custom_rounded_icon_widget.dart';
import 'custom_store_details_item_widget.dart';

class CustomStoreHeaderWidget extends StatelessWidget {
  const CustomStoreHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomImageNetwork(
          image: AppAssets.testImage,
          widthImage: context.width,
          heightImage: 134.h,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24.r),
          ),
        ),
        PositionedDirectional(
          start: 24.w,
          top: 8.h,
          child: SafeArea(
            child: CustomRoundedIconWidget(
              onTap: () {
                context.pop();
              },
              icon: AppAssets.smallArrowBack,
            ),
          ),
        ),
        PositionedDirectional(
          end: 24.w,
          top: 8.h,
          child: SafeArea(
            child: CustomRoundedIconWidget(
              onTap: () {},
              icon: AppAssets.heartFilled,
            ),
          ),
        ),
        PositionedDirectional(
          bottom: -110.h,
          start: 24.w,
          end: 24.w,
          child: Container(
            padding: EdgeInsetsDirectional.only(
              start: 20.w,
              end: 16.w,
              top: 12.h,
              bottom: 19.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [AppShadows.defaultShadow],
              border: Border.all(color: AppColors.greyColor),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.grayNinthColor,
                        ),
                      ),
                      child: CustomImageNetwork(
                        image: AppAssets.testImage,
                        radiusValue: 16.r,
                        heightImage: 56.h,
                        widthImage: 62.w,
                      ),
                    ),
                    widthSpace(5.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "زارا",
                                  style: AppTextStyles.textStyle14
                                      .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.star,
                                size: 16.r,
                                color: AppColors.ratingStarColor,
                              ),
                              widthSpace(2.w),
                              Text(
                                "4.5",
                                style: AppTextStyles.textStyle10
                                    .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          heightSpace(4.h),
                          Text(
                            "ملابس نسائي",
                            style: AppTextStyles.textStyle8
                                .copyWith(
                              fontWeight: FontWeight.w500,
                              color:
                              AppColors.blackTextNinthColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                heightSpace(16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      CustomStoreDetailsItemWidget(
                        icon: AppAssets.timer,
                        title: "وقت التوصيل",
                        body: "1 - 2 أيام",
                      ),
                      VerticalDivider(
                        color: AppColors.greyColor,
                        width: 1,
                      ),
                      CustomStoreDetailsItemWidget(
                        icon: AppAssets.time,
                        title: "مواعيد العمل",
                        body: "09:00 ص - 11:00 م",
                      ),
                      VerticalDivider(
                        color: AppColors.greyColor,
                        width: 1,
                      ),
                      CustomStoreDetailsItemWidget(
                        icon: AppAssets.location,
                        title: "مسافة",
                        body: "12.2 كم",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
