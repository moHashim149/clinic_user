import 'dart:io';
import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:svg_image_provider/svg_image_provider.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/extensions/on_tap.dart';

class CustomProfilePickerWidget extends StatelessWidget {
  final File? pickedImage;
  final String? profileImage;
  final VoidCallback pickImage;
  final double? width,height,borderWidth,editWidth,editHeight,editBorderWidth;
  const CustomProfilePickerWidget({
    super.key,
    this.pickedImage,
    required this.pickImage,
  this.width, this.height ,
  this.editWidth, this.editHeight,
    this.editBorderWidth,
  this.borderWidth, this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width ?? 84.w,
        height: height ?? 84.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryColor, width: borderWidth ?? 0.56.w),
          image: pickedImage != null || profileImage != null
              ? DecorationImage(
                  image: pickedImage != null
                      ? FileImage(pickedImage!)
                      : profileImage != null
                      ? NetworkImage(profileImage!)
                      : SvgImageProvider(AppAssets.user),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        padding: EdgeInsets.all(4.w),
        alignment: Alignment.bottomRight,
        child: Container(
          width: editWidth ?? 28.w,
          height: editHeight ?? 28.w,
          padding: EdgeInsets.all(4.44.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.whiteColor, width: editBorderWidth ?? 0.56.w),
            color: AppColors.primaryColor,
          ),
          child: SvgPicture.asset(AppAssets.edit),
        ).onTap(function: pickImage),
      ),
    );
  }
}
