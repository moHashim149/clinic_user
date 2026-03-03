import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_back_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../data/models/reservation_details_model.dart';
import 'package:dotted_line/dotted_line.dart';

class ReservationDetailsView extends StatelessWidget {
  final ReservationDetailsModel reservationDetails;

  const ReservationDetailsView({super.key, required this.reservationDetails});

  Color _getStatusColor() {
    switch (reservationDetails.statusKey) {
      case 1: // assuming 1 is new
        return const Color(0xFF1C443A);
      case 2: // current
        return const Color(0xFFBAE1FF);
      case 3: // in progress
        return const Color(0xFFFFD6C0);
      default:
        return const Color(0xFFC6C6C6);
    }
  }

  Color _getStatusTextColor() {
    switch (reservationDetails.statusKey) {
      case 1:
        return Colors.white;
      default:
        return AppColors.blackColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 24.w),
                  Text(
                    LocaleKeys.reservationDetails.tr(),
                    style: AppTextStyles.textStyle20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CustomBackWidget(),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace(24.h),
                    // Order Information Card
                    Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: const Color(0xFFC6C6C6)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${LocaleKeys.dateAndTime.tr()}: ",
                                    style: AppTextStyles.textStyle12.copyWith(
                                      color: AppColors.blackTextEighthColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    reservationDetails.date,
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
                                  reservationDetails.status,
                                  style: AppTextStyles.textStyle10.copyWith(
                                    color: _getStatusTextColor(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          heightSpace(12.h),
                          Row(
                            children: [
                              Text(
                                "${LocaleKeys.orderNumber.tr()}: ",
                                style: AppTextStyles.textStyle12.copyWith(
                                  color: AppColors.blackTextEighthColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                reservationDetails.orderNumber,
                                style: AppTextStyles.textStyle12.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    heightSpace(16.h),

                    // Actions Row
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () {
                              // Action: Call
                            },
                            backgroundColor: Colors.white,
                            borderColor: AppColors.primaryColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.phone_outlined,
                                  color: AppColors.primaryColor,
                                  size: 20.r,
                                ),
                                widthSpace(8.w),
                                Text(
                                  LocaleKeys.call.tr(),
                                  style: AppTextStyles.textStyle14.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        widthSpace(16.w),
                        Expanded(
                          child: CustomButton(
                            onPressed: () {
                              // Action: Chat
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.chat_bubble_outline,
                                  color: Colors.white,
                                  size: 20.r,
                                ),
                                widthSpace(8.w),
                                Text(
                                  LocaleKeys.chat.tr(),
                                  style: AppTextStyles.textStyle14.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    heightSpace(24.h),

                    // Clinic Info
                    Text(
                      LocaleKeys.beautyClinic.tr(),
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    heightSpace(12.h),
                    Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: const Color(0xFFC6C6C6)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.grey[200],
                            ),
                          ),
                          widthSpace(12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  reservationDetails.clinicName,
                                  style: AppTextStyles.textStyle14.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                heightSpace(4.h),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16.r,
                                    ),
                                    widthSpace(4.w),
                                    Text(
                                      reservationDetails.clinicRating
                                          .toString(),
                                      style: AppTextStyles.textStyle12,
                                    ),
                                  ],
                                ),
                                heightSpace(4.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 16.r,
                                      color: AppColors.blackTextEighthColor,
                                    ),
                                    widthSpace(4.w),
                                    Expanded(
                                      child: Text(
                                        "${reservationDetails.locationDistrict} - ${reservationDetails.locationSubText}",
                                        style: AppTextStyles.textStyle10
                                            .copyWith(
                                              color: AppColors
                                                  .blackTextEighthColor,
                                            ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Open map
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.map_outlined,
                                  color: AppColors.primaryColor,
                                  size: 24.r,
                                ),
                                heightSpace(4.h),
                                Text(
                                  LocaleKeys.openMap.tr(),
                                  style: AppTextStyles.textStyle8.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    heightSpace(24.h),

                    // Price details
                    Text(
                      LocaleKeys.invoiceSummary.tr(),
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    heightSpace(12.h),
                    Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: const Color(0xFFC6C6C6)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                LocaleKeys.productsPrice.tr(),
                                style: AppTextStyles.textStyle12,
                              ),
                              Text(
                                "${reservationDetails.originalPrice} ﷼",
                                style: AppTextStyles.textStyle12,
                              ),
                            ],
                          ),
                          heightSpace(12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                LocaleKeys.discount.tr(),
                                style: AppTextStyles.textStyle12,
                              ),
                              Text(
                                "${reservationDetails.discount} ﷼",
                                style: AppTextStyles.textStyle12.copyWith(
                                  color: AppColors.redColor,
                                ),
                              ),
                            ],
                          ),
                          heightSpace(12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                LocaleKeys.tax.tr(),
                                style: AppTextStyles.textStyle12,
                              ),
                              Text(
                                "${reservationDetails.vat} ﷼",
                                style: AppTextStyles.textStyle12,
                              ),
                            ],
                          ),
                          heightSpace(16.h),
                          DottedLine(dashColor: AppColors.strokeColor),
                          heightSpace(16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                LocaleKeys.grandTotal.tr(),
                                style: AppTextStyles.textStyle14.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${reservationDetails.total} ﷼",
                                style: AppTextStyles.textStyle16.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    heightSpace(32.h),
                  ],
                ),
              ),
            ),

            // Bottom Action
            Padding(
              padding: EdgeInsets.all(24.r),
              child: CustomButton(
                onPressed: () {
                  // Action based on status
                  // For example, Report Complaint
                },
                backgroundColor: AppColors.redColor.withOpacity(0.1),
                borderColor: AppColors.transparentColor,
                text: LocaleKeys.report.tr(),
                style: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.redColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
