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
import 'package:dotted_line/dotted_line.dart';

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
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Offer Number and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${LocaleKeys.offerId.tr()}: ",
                      style: AppTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackTextEighthColor,
                      ),
                    ),
                    Text(
                      reservation.offerNumber,
                      style: AppTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Text(
                    reservation.status,
                    style: AppTextStyles.textStyle10.copyWith(
                      color: _getStatusTextColor(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            heightSpace(12.h),

            // Order Number
            Row(
              children: [
                Text(
                  "${LocaleKeys.orderNumber.tr()}: ",
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackTextEighthColor,
                  ),
                ),
                Text(
                  reservation.orderNumber,
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            heightSpace(12.h),

            // Date and Time
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 16.r,
                  color: AppColors.blackTextEighthColor,
                ),
                widthSpace(8.w),
                Text(
                  reservation.date,
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            heightSpace(12.h),

            // Location
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 16.r,
                  color: AppColors.blackTextEighthColor,
                ),
                widthSpace(8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reservation.locationDistrict,
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      heightSpace(4.h),
                      Text(
                        reservation.locationSubText,
                        style: AppTextStyles.textStyle10.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackTextEighthColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            heightSpace(16.h),
            DottedLine(dashColor: AppColors.strokeColor),
            heightSpace(12.h),

            // Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.grandTotal.tr(),
                  style: AppTextStyles.textStyle12.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${reservation.price}",
                      style: AppTextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    widthSpace(4.w),
                    SvgPicture.asset(
                      AppAssets.currency,
                      width: 10.w,
                      height: 12.h,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
