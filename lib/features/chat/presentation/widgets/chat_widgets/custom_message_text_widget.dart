import 'package:brandy_user/core/framework/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/util/extensions/media_query.dart';
import '../../../data/models/message_model.dart';

class CustomMessageTextWidget extends StatelessWidget {
  final MessageModel message;
  const CustomMessageTextWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(24.r),
          topStart: message.viewType == "sender" ? Radius.zero : Radius.circular(24.r),
          bottomEnd:   Radius.circular(24.r),
          bottomStart: Radius.circular(24.r),
        ),
        color: message.viewType != "sender" ? AppColors.secondary4Color : AppColors.primaryColor,
      ),
      constraints: BoxConstraints(
        maxWidth: context.width * 0.7,
        minWidth: context.width * 0.7,
      ),
      padding: EdgeInsetsDirectional.only(
        start: 15.w,
        top: 18.h,
        bottom: 23.h,
        end: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.message!,
            style: AppTextStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w500,
              color:  message.viewType != "sender" ? AppColors.blackTextSecondaryColor : AppColors.secondary4Color,
            ),
          ),
          heightSpace(2.h),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Text(
              message.createdAt,
              style: AppTextStyles.textStyle10.copyWith(
                fontWeight: FontWeight.w500,
                color:  message.viewType != "sender" ? AppColors.blackTextSecondaryColor : AppColors.secondary4Color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}