import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/app_validator.dart';

class CustomPinCodeWidget extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  final Function(String?) onSubmitted;

  const CustomPinCodeWidget({
    super.key,
    required this.controller,
    required this.formKey,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          controller: controller,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          defaultPinTheme: buildPinTheme(context),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onCompleted: onSubmitted,
          onSubmitted: onSubmitted,
          errorTextStyle: AppTextStyles.textStyle14.copyWith(
            color: AppColors.redColor,
          ),
          validator: AppValidator.otpValidator,
          errorPinTheme: buildPinTheme(context, AppColors.redColor),
          submittedPinTheme: buildPinTheme(context,AppColors.primaryColor),
          disabledPinTheme: buildPinTheme(context),
          focusedPinTheme: buildPinTheme(context, AppColors.primaryColor),
          length: 4,
          showCursor: true,
        ),
      ),
    );
  }

  PinTheme buildPinTheme(BuildContext context, [Color? color]) {
    return PinTheme(
      height: 58.h,
      width: 83.w,
      textStyle: AppTextStyles.textStyle16.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.hintColor,
      ),
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: color ?? AppColors.strokeColor),
      ),
    );
  }
}
