import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/features/clinics/data/models/offer_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import '../../../../core/constants/app_colors.dart';

class OfferDetailsView extends StatelessWidget {
  final OfferModel offer;

  const OfferDetailsView({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildCashbackBanner(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  heightSpace(24.h),
                  _buildCategoryAndTag(),
                  heightSpace(12.h),
                  _buildTitleAndPrice(),
                  heightSpace(24.h),
                  _buildAttributesSection(),
                  heightSpace(24.h),
                  _buildDescriptionSection(),
                  heightSpace(40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(offer.headerImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
          ),
        ),
        Positioned(
          top: 50.h,
          left: 20.w,
          right: 20.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xfff0fcfe).withOpacity(0.9),
                    radius: 19.r,
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        size: 20.r,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  widthSpace(16.w),
                  CircleAvatar(
                    backgroundColor: const Color(0xfff0fcfe).withOpacity(0.9),
                    radius: 19.r,
                    child: IconButton(
                      icon: Icon(
                        Icons.share_outlined,
                        size: 20.r,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "${LocaleKeys.offerId.tr()}: ${offer.offerNumber}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                  widthSpace(16.w),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 19.r,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 18.r,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -40.h,
          left: 20.w,
          right: 20.w,
          child: _buildClinicCard(),
        ),
      ],
      clipBehavior: Clip.none,
    );
  }

  Widget _buildClinicCard() {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: const Color(0xffc6c6c6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "(${offer.ratingCount})",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        widthSpace(4.w),
                        Text(
                          offer.rating.toString(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.black,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        widthSpace(4.w),
                        Icon(Icons.star, color: Colors.amber, size: 14.r),
                      ],
                    ),
                    Text(
                      offer.clinicName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
                heightSpace(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.openMap.tr(),
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xffB76E8E),
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${offer.locationDistrict} | ${offer.locationSubText}",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: const Color(0xff4F4F4F),
                            fontFamily: 'Cairo',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        widthSpace(4.w),
                        Icon(
                          Icons.location_on_outlined,
                          size: 16.r,
                          color: const Color(0xff4F4F4F),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          widthSpace(12.w),
          Container(
            width: 62.r,
            height: 62.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: NetworkImage(offer.clinicLogo),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCashbackBanner() {
    return Container(
      margin: EdgeInsets.only(top: 64.h, left: 20.w, right: 20.w),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffe9ffff), Colors.white, Color(0xffe9ffff)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.cashbackMessage.tr(
              namedArgs: {'points': offer.cashbackPoints.toString()},
            ),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: 'Cairo',
            ),
          ),
          widthSpace(8.w),
          Icon(Icons.stars, color: Colors.amber, size: 24.r),
        ],
      ),
    );
  }

  Widget _buildCategoryAndTag() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: const Color(0xfff0fcfe),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            offer.tag,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xff686868),
              fontFamily: 'Cairo',
            ),
          ),
        ),
        widthSpace(8.w),
        Text(
          offer.category,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff686868),
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  Widget _buildTitleAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${offer.oldPrice} ﷼",
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xff4F4F4F),
                decoration: TextDecoration.lineThrough,
                fontFamily: 'Cairo',
              ),
            ),
            widthSpace(8.w),
            Text(
              "${offer.price} ﷼",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontFamily: 'Cairo',
              ),
            ),
          ],
        ),
        Text(
          offer.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  Widget _buildAttributesSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: const Color(0xfff8f8f8),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: _buildAttributeItem(
                LocaleKeys.deviceUsed.tr(),
                offer.deviceUsed,
              ),
            ),
            const VerticalDivider(
              color: Color(0xffb9b9b9),
              thickness: 1,
              indent: 8,
              endIndent: 8,
            ),
            Expanded(
              child: _buildAttributeItem(
                LocaleKeys.sessionsCount.tr(),
                offer.sessionsCount,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttributeItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 8.sp,
            color: const Color(0xff3D3D3D),
            fontFamily: 'Cairo',
          ),
        ),
        heightSpace(4.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff3D3D3D),
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          LocaleKeys.offerDescription.tr(),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontFamily: 'Cairo',
          ),
        ),
        heightSpace(8.h),
        Text(
          offer.description,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xff4F4F4F),
            fontFamily: 'Cairo',
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
