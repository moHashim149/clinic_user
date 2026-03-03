import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

abstract class AppTextStyles {
  static final TextStyle textStyle32 = TextStyle(
      fontSize: AppFonts.t32,
      fontWeight: FontWeight.w700,
      color: AppColors.blackColor
  );
  static final TextStyle textStyle24 = TextStyle(
      fontSize: AppFonts.t24,
      fontWeight: FontWeight.w700,
      color: AppColors.blackColor);
  static final TextStyle textStyle20 = TextStyle(
      fontSize: AppFonts.t20,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);
  static final TextStyle textStyle18 = TextStyle(
      fontSize: AppFonts.t18,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);
  static final TextStyle textStyle18w700 = TextStyle(
      fontSize: AppFonts.t18,
      fontWeight: FontWeight.w700,
      color: AppColors.blackColor);
  static final TextStyle textStyle16 = TextStyle(
      fontSize: AppFonts.t16,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);
  static final TextStyle textStyle15 = TextStyle(
      fontSize: AppFonts.t15,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);

  static final TextStyle textStyle14 = TextStyle(
      fontSize: AppFonts.t14,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);

  static final TextStyle textStyle12 = TextStyle(
      fontSize: AppFonts.t12,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);

  static final TextStyle textStyle12w500 = TextStyle(
      fontSize: AppFonts.t12,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor
  );

  static final TextStyle textStyle10 = TextStyle(
      fontSize: AppFonts.t10,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);
  static final TextStyle textStyle8 = TextStyle(
      fontSize: AppFonts.t8,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);
  static final TextStyle textStyle6 = TextStyle(
      fontSize: AppFonts.t6,
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor);

  static final TextStyle textStyle8Grey = TextStyle(
    fontSize: AppFonts.t8,
    fontWeight: FontWeight.w400,
    height: 1.0, 
    letterSpacing: 0.0, 
    color: AppColors.greyTextColor,
  );

  static final TextStyle textStyle7 = TextStyle(
    fontSize: AppFonts.t7,
    fontWeight: FontWeight.w400,
    height: 1.0, 
    letterSpacing: 0.0, 
    color: AppColors.blackColor,
  );

  static final TextStyle title = TextStyle(
    fontSize: AppFonts.t20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static final TextStyle subtitle = TextStyle(
    fontSize: AppFonts.t16,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static final TextStyle buttonLabel = TextStyle(
    fontSize: AppFonts.t18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final TextStyle textButtonLabel = TextStyle(
    fontSize: AppFonts.t18,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static final TextStyle languageSwitch = TextStyle(
    fontSize: AppFonts.t14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );
}
