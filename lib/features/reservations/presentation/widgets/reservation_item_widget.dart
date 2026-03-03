import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../data/models/reservation_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';

class ReservationItemWidget extends StatelessWidget {
  final ReservationModel reservation;
  final VoidCallback onTap;

  const ReservationItemWidget({
    super.key,
    required this.reservation,
    required this.onTap,
  });

  Color _getStatusColor() {
    switch (reservation.statusKey) {
      case 'new':
        return const Color(0xFF1C443A);
      case 'current':
        return const Color(0xFFBAE1FF);
      case 'in_progress':
        return const Color(0xFFFFD6C0);
      case 'ended':
      case 'missed':
      case 'previous':
      default:
        return const Color(0xFFC6C6C6);
    }
  }

  Color _getStatusTextColor() {
    switch (reservation.statusKey) {
      case 'new':
        return Colors.white;
      default:
        return AppColors.blackColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: const Color(0xFFC6C6C6)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Status and Offer Number
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Right child: Offer Number
                Row(
                  children: [
                    Text(
                      "${LocaleKeys.offerId.tr()}: ",
                      style: AppTextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      reservation.offerNumber,
                      style: AppTextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                // Left child: Status Tag
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    reservation.status,
                    style: AppTextStyles.textStyle14.copyWith(
                      color: _getStatusTextColor(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // Divider
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: const Divider(
                color: Color(0xFFC6C6C6),
                thickness: 1,
                height: 1,
              ),
            ),

            // Order Number and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Right child: Order Number
                Row(
                  children: [
                    Text(
                      "${LocaleKeys.orderNumber.tr()}: ",
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    Text(
                      reservation.orderNumber,
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
                // Left child: Price
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${reservation.price}",
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    widthSpace(4.w),
                    SvgPicture.asset(
                      AppAssets.currency,
                      width: 14.w,
                      height: 14.h,
                      colorFilter: const ColorFilter.mode(
                        AppColors.blackColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            heightSpace(16.h),

            // Date and Time
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.calender,
                  width: 20.r,
                  height: 20.r,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                widthSpace(8.w),
                Text(
                  reservation.date,
                  style: AppTextStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            heightSpace(12.h),

            // Location
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppAssets.locationIcon2, // Replacing old Icon with mapped SVG
                  width: 20.r,
                  height: 20.r,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                widthSpace(8.w),
                Expanded(
                  child: Text(
                    "${reservation.locationDistrict} | ${reservation.locationSubText}",
                    style: AppTextStyles.textStyle14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackTextEighthColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
