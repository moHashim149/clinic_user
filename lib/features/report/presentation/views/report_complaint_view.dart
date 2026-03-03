import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_back_widget.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../generated/locale_keys.g.dart';

class ReportComplaintView extends StatelessWidget {
  const ReportComplaintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 24.w),
                  Text(
                    LocaleKeys.report.tr(),
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

                    Text(
                      LocaleKeys.complaintTitle.tr(),
                      style: AppTextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    heightSpace(12.h),
                    CustomTextFormField(
                      hintText: LocaleKeys.complaintTitle.tr(),
                      fillColor: const Color(0xFFF7F7F7),
                    ),

                    heightSpace(24.h),

                    Text(
                      LocaleKeys.complaintText.tr(),
                      style: AppTextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    heightSpace(12.h),
                    CustomTextFormField(
                      hintText: LocaleKeys.complaintText.tr(),
                      fillColor: const Color(0xFFF7F7F7),
                      maxLines: 5,
                    ),

                    heightSpace(24.h),

                    Text(
                      LocaleKeys.attachImageOptional.tr(),
                      style: AppTextStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    heightSpace(12.h),

                    // Mock Image Upload Widget
                    GestureDetector(
                      onTap: () {
                        // Action: Pick image
                      },
                      child: Container(
                        height: 120.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F7F7),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: AppColors.strokeColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_upload_outlined,
                              color: AppColors.primaryColor,
                              size: 32.r,
                            ),
                            heightSpace(8.h),
                            Text(
                              LocaleKeys.attachImageOptional.tr(),
                              style: AppTextStyles.textStyle12.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Actions
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: Colors.white,
                      borderColor: AppColors.strokeColor,
                      text: LocaleKeys.cancel.tr(),
                      style: AppTextStyles.textStyle16.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  widthSpace(16.w),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        // Action: Submit
                        Navigator.pop(context);
                      },
                      text: LocaleKeys.submitComplaint.tr(),
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
