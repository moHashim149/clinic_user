import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/widgets/custom_button.dart';
import 'package:brandy_user/features/auth/data/arguments/verify_email_argument.dart';
import 'success_registration_dialog.dart';

class VerifyEmailView extends StatefulWidget {
  final VerifyEmailArgument argument;
  const VerifyEmailView({super.key, required this.argument});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  late Timer _timer;
  final ValueNotifier<int> _secondsNotifier = ValueNotifier<int>(60);
  final TextEditingController _otpController = TextEditingController();

  static PinTheme get _defaultTheme => PinTheme(
        width: 75.w,
        height: 75.w,
        textStyle: AppTextStyles.textStyle24.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.indicatorInactive, width: 1.5),
          color: AppColors.whiteColor,
        ),
      );

  static PinTheme get _focusedTheme => PinTheme(
        width: 75.w,
        height: 75.w,
        textStyle: AppTextStyles.textStyle24.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primary, width: 1.5),
          color: AppColors.whiteColor,
        ),
      );

  /// Submitted (digit entered) — dark border + mint background
  static PinTheme get _submittedTheme => PinTheme(
        width: 75.w,
        height: 75.w,
        textStyle: AppTextStyles.textStyle24.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primary, width: 1.5),
          color: AppColors.mintBackground, // light mint tint
        ),
      );

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsNotifier.value == 0) {
        timer.cancel();
      } else {
        _secondsNotifier.value--;
      }
    });
  }

  void _resendCode() {
    if (_secondsNotifier.value == 0) {
      _secondsNotifier.value = 60;
      _startTimer();
    }
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _otpController.dispose();
    _secondsNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              heightSpace(20.h),
              Align(
                alignment: Alignment.topRight,
                child:InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.indicatorInactive),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
              heightSpace(40.h),
              // Title
              Text(
                "التحقق من بريدك",
                style: AppTextStyles.textStyle20.copyWith(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Cairo',
                ),
              ),
              heightSpace(16.h),
              Text.rich(
                TextSpan(
                  text: "تم إرسال رمز التحقق الى\n",
                  style: AppTextStyles.textStyle16.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Cairo',
                  ),
                  children: [
                    TextSpan(
                      text: widget.argument.email,
                      style: AppTextStyles.textStyle16.copyWith(
                        color: AppColors.headline,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    TextSpan(
                      text: "\nأدخل الرمز",
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.hintColor,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              heightSpace(40.h),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: _otpController,
                  length: 4,
                  defaultPinTheme: _defaultTheme,
                  focusedPinTheme: _focusedTheme,
                  submittedPinTheme: _submittedTheme,
                  onTapOutside: (_) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                ),
              ),
              heightSpace(60.h),
              // Resend timer / button
              ValueListenableBuilder<int>(
                valueListenable: _secondsNotifier,
                builder: (context, seconds, _) {
                  final minutes = seconds ~/ 60;
                  final secs = seconds % 60;
                  final timerText =
                      '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';

                  return seconds > 0
                      ? Text.rich(
                          TextSpan(
                            text: "لم يصلك رمز؟ أعد الإرسال بعد ",
                            style: AppTextStyles.textStyle16.copyWith(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Cairo',
                            ),
                            children: [
                              TextSpan(
                                text: timerText,
                                style: AppTextStyles.textStyle16.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        )
                      : InkWell(
                          onTap: _resendCode,
                          child: Text(
                            "لم يصلك رمز؟ أعد الإرسال",
                            style: AppTextStyles.textStyle14.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Cairo',
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                },
              ),
              heightSpace(40.h),
              // Confirm button
              CustomButton(
                text: "تأكيد",
                height: 56.h,
                borderRadius: BorderRadius.circular(30.r),
                backgroundColor: AppColors.primary,
                onPressed: () {
                  showSuccessRegistrationDialog(context);
                },
              ),
              heightSpace(40.h),
            ],
          ),
        ),
      ),
    );
  }
}
