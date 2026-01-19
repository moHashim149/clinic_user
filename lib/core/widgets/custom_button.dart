import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';
import 'custom_loading.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final void Function() onPressed;
  final double? height, width, strokeWidth,horizontalMarginValue;
  final Color? backgroundColor;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;
  final double? loadingValue;

  final EdgeInsets? padding;

  final String? text;
  final TextStyle? style;
  final bool? isLoading;


  const CustomButton({
    super.key,
    this.child,
    this.text,
    this.loadingValue,
    this.style,
    required this.onPressed,
    this.height,
    this.horizontalMarginValue,
    this.width,
    this.backgroundColor,
    this.isLoading = false,
    this.borderSide,
    this.borderRadius,
    this.padding,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontalMarginValue != null ? EdgeInsets.symmetric(horizontal: horizontalMarginValue!) : EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? AppColors.primaryColor,
          ),
          elevation: const WidgetStatePropertyAll(0),

          padding: WidgetStatePropertyAll(padding ?? EdgeInsets.zero),
          fixedSize: WidgetStatePropertyAll(
            Size(width ?? (double.infinity), height ?? 50.h),
          ),
          minimumSize: WidgetStatePropertyAll(
            Size(width ?? (double.infinity), height ?? 50.h),
          ),

          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(24.r),
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: WidgetStatePropertyAll(borderSide ?? BorderSide.none),
        ),
        child: Center(
          child: isLoading == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child:
                          child ??
                          Text(
                            text!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style:
                                style ??
                                AppTextStyles.textStyle16.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.whiteColor,
                                ),
                          ),
                    ),
                    widthSpace(4.w),
                    CustomLoading(
                      isButton: true,
                      value: loadingValue,
                      strokeWidth: strokeWidth ?? 3.5.w,
                    ),
                  ],
                )
              : child ??
                    Text(
                      text!,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                          style ??
                          AppTextStyles.textStyle16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteColor,
                          ),
                    ),
        ),
      ),
    );
  }
}
