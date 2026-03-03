import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/widgets/custom_image_network.dart';
import 'package:brandy_user/features/cart/data/models/offer_cart_item_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';

class CustomOfferCartItemWidget extends StatelessWidget {
  final OfferCartItemModel offerCartItemModel;
  final VoidCallback onDelete;
  final VoidCallback onCompleteBooking;

  const CustomOfferCartItemWidget({
    super.key,
    required this.offerCartItemModel,
    required this.onDelete,
    required this.onCompleteBooking,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xffc6c6c6)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                Stack(
                  children: [
                    CustomImageNetwork(
                      image: offerCartItemModel.image,
                      widthImage: 350.w,
                      heightImage: 144.h,
                      radiusValue: 9.r,
                    ),
                    Positioned(
                      top: 10.h,
                      right: 10.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Text(
                          "${LocaleKeys.orderNumber.tr()}: ${offerCartItemModel.offerNumber}",
                          style: AppTextStyles.textStyle10.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                heightSpace(12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.timer,
                          width: 12.w,
                          height: 12.h,
                          color: AppColors.primaryColor,
                        ),
                        widthSpace(4.w),
                        Text(
                          offerCartItemModel.bookingDate,
                          style: AppTextStyles.textStyle10.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            offerCartItemModel.price.toStringAsFixed(2),
                            style: AppTextStyles.textStyle14.copyWith(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                        widthSpace(4.w),
                        SvgPicture.asset(
                          AppAssets.currency,
                          width: 16.w,
                          height: 12.h,
                          color: AppColors.blackColor,
                        ),
                      ],
                    ),
                  ],
                ),
                heightSpace(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      offerCartItemModel.district,
                      style: AppTextStyles.textStyle10.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayColor,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    widthSpace(4.w),
                    Container(
                      width: 1.w,
                      height: 12.h,
                      color: const Color(0xffc6c6c6),
                    ),
                    widthSpace(4.w),
                    Flexible(
                      child: Text(
                        offerCartItemModel.locationSubText,
                        style: AppTextStyles.textStyle10.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.grayColor,
                          fontFamily: 'Cairo',
                        ),
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    widthSpace(4.w),
                    SvgPicture.asset(
                      AppAssets.location,
                      width: 16.w,
                      height: 16.h,
                      color: const Color(0xff00d084),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    onPressed: onDelete,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.redColor,
                      side: BorderSide(color: AppColors.redColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(57.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.delete.tr(),
                          style: AppTextStyles.textStyle14.copyWith(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        widthSpace(8.w),
                        SvgPicture.asset(
                          AppAssets.trash,
                          width: 20.w,
                          height: 20.h,
                          color: AppColors.redColor,
                        ),
                      ],
                    ),
                  ),
                ),
                widthSpace(12.w),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: onCompleteBooking,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(57.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      elevation: 0,
                    ),
                    child: Text(
                      LocaleKeys.completeBooking.tr(),
                      style: AppTextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
