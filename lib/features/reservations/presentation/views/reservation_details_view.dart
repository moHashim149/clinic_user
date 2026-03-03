import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import '../../../../core/widgets/custom_back_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../data/models/reservation_details_model.dart';

class ReservationDetailsView extends StatelessWidget {
  final ReservationDetailsModel reservationDetails;

  const ReservationDetailsView({super.key, required this.reservationDetails});

  void _showQrDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Container(
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFC6C6C6)),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                heightSpace(16.h),
                Icon(Icons.qr_code_2, size: 200.r, color: Colors.black),
                heightSpace(16.h),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 40.w),
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
                  children: [
                    heightSpace(24.h),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              context.pushWithNamed(Routes.chatView);
                            },
                            borderRadius: BorderRadius.circular(24.r),
                            child: Container(
                              height: 48.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                border: Border.all(
                                  color: const Color(0xFFC6C6C6),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.chat,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.blackColor,
                                      BlendMode.srcIn,
                                    ),
                                    width: 22.w,
                                  ),
                                  widthSpace(8.w),
                                  Text(
                                    LocaleKeys.chat.tr(), // fallback
                                    style: AppTextStyles.textStyle16.copyWith(
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        widthSpace(16.w),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // Action: Call
                            },
                            borderRadius: BorderRadius.circular(24.r),
                            child: Container(
                              height: 48.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.r),
                                border: Border.all(
                                  color: const Color(0xFFC6C6C6),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.call,
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.blackColor,
                                      BlendMode.srcIn,
                                    ),
                                    width: 22.w,
                                  ),
                                  widthSpace(8.w),
                                  Text(
                                    LocaleKeys.call.tr(),
                                    style: AppTextStyles.textStyle16.copyWith(
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    heightSpace(24.h),

                    // Order Info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Row(
                          children: [
                            Text(
                              reservationDetails.date,
                              style: AppTextStyles.textStyle14.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                            ),
                            widthSpace(4.w),
                            Text(
                              ":تاريخ الطلب",
                              style: AppTextStyles.textStyle14.copyWith(
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    heightSpace(8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFBAE1FF),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Text(
                            reservationDetails.status,
                            style: AppTextStyles.textStyle12.copyWith(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              reservationDetails.orderNumber,
                              style: AppTextStyles.textStyle14.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                            ),
                            widthSpace(4.w),
                            Text(
                              ":رقم الطلب",
                              style: AppTextStyles.textStyle14.copyWith(
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    heightSpace(24.h),

                    // Clinic Card
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
                            width: 64.r,
                            height: 64.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: const Color(0xFF5A665A),
                            ),
                            child: Center(
                              child: Text(
                                "M",
                                style: AppTextStyles.textStyle24.copyWith(
                                  color: Colors.white30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          widthSpace(12.w),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: const Color(0xFF1C443A),
                                          size: 16.r,
                                        ),
                                        widthSpace(4.w),
                                        Text(
                                          "${reservationDetails.clinicRating} (189)",
                                          style: AppTextStyles.textStyle12
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.blackColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Text(
                                        reservationDetails.clinicName,
                                        style: AppTextStyles.textStyle16
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.blackColor,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                heightSpace(12.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        // Open Map
                                      },
                                      child: Text(
                                        LocaleKeys.openMap.tr(),
                                        style: AppTextStyles.textStyle12
                                            .copyWith(
                                              color: const Color(0xFF1C443A),
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor: const Color(
                                                0xFF1C443A,
                                              ),
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${reservationDetails.locationDistrict} | ${reservationDetails.locationSubText}",
                                              style: AppTextStyles.textStyle12
                                                  .copyWith(
                                                    color: AppColors
                                                        .blackTextEighthColor,
                                                  ),
                                              textAlign: TextAlign.right,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          widthSpace(8.w),
                                          SvgPicture.asset(
                                            AppAssets.locationIcon2,
                                            width: 14.w,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    heightSpace(24.h),

                    Text(
                      "تفاصيل العرض",
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
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
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: Image.network(
                                      reservationDetails.offerImage.isNotEmpty
                                          ? reservationDetails.offerImage
                                          : AppAssets.testImage,
                                      width: 70.r,
                                      height: 70.r,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  widthSpace(12.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "رقم العرض: ${reservationDetails.offerNumber}",
                                        style: AppTextStyles.textStyle12
                                            .copyWith(
                                              color: const Color(0xFF1C443A),
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      heightSpace(8.h),
                                      Text(
                                        "جلسه",
                                        style: AppTextStyles.textStyle16
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.blackColor,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${reservationDetails.total}",
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
                          const Divider(
                            color: Color(0xFFECECEC),
                            thickness: 1,
                            height: 1,
                          ),
                          heightSpace(20.h),
                          InkWell(
                            onTap: () {
                              _showQrDialog(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              child: Text(
                                "ال qr code الخاص بك",
                                style: AppTextStyles.textStyle16.copyWith(
                                  color: const Color(0xFF1C443A),
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: const Color(0xFF1C443A),
                                ),
                              ),
                            ),
                          ),
                          heightSpace(8.h),
                        ],
                      ),
                    ),
                    heightSpace(24.h),

                    Text(
                      "بيانات الحجز",
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    heightSpace(12.h),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: const Color(0xFFC6C6C6)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.calender,
                                      colorFilter: const ColorFilter.mode(
                                        Color(0xFF1C443A),
                                        BlendMode.srcIn,
                                      ),
                                      width: 14.w,
                                    ),
                                    widthSpace(6.w),
                                    Text(
                                      "وقت الحجز",
                                      style: AppTextStyles.textStyle12.copyWith(
                                        color: AppColors.blackTextEighthColor,
                                      ),
                                    ),
                                  ],
                                ),
                                heightSpace(8.h),
                                Text(
                                  reservationDetails.time,
                                  style: AppTextStyles.textStyle14.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 48.h,
                            color: const Color(0xFFECECEC),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.access_time_outlined,
                                      color: const Color(0xFF9E6569),
                                      size: 16.r,
                                    ),
                                    widthSpace(6.w),
                                    Text(
                                      "تاريخ الحجز",
                                      style: AppTextStyles.textStyle12.copyWith(
                                        color: AppColors.blackTextEighthColor,
                                      ),
                                    ),
                                  ],
                                ),
                                heightSpace(8.h),
                                Text(
                                  reservationDetails.date,
                                  style: AppTextStyles.textStyle14.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    heightSpace(32.h),
                  ],
                ),
              ),
            ),

            // Bottom Reporting Button
            Padding(
              padding: EdgeInsets.all(24.w),
              child: SafeArea(
                bottom: true,
                child: InkWell(
                  onTap: () {
                    context.pushWithNamed(Routes.reportComplaintView);
                  },
                  borderRadius: BorderRadius.circular(30.r),
                  child: Container(
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: Colors.red),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ابلاغ",
                          style: AppTextStyles.textStyle18.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        widthSpace(8.w),
                        Icon(
                          Icons.report_problem,
                          color: Colors.red,
                          size: 24.r,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
