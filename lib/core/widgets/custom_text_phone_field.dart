import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_assets.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';
import '../helpers/custom_phone_controller.dart';

class CustomTextPhoneField extends StatefulWidget {
  final PhoneFieldController phoneFieldController;
  final double? paddingVerticalValue,
      contentPaddingVerticalValue,
      borderRadiusValue;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool enableFocusBorderColor;
  final Color? borderColor;
  final TextStyle? errorStyle, countryStyle, hintStyle, valueStyle;
  final BoxConstraints? suffixIconConstraints;

  const CustomTextPhoneField({
    super.key,
    required this.phoneFieldController,
    this.contentPaddingVerticalValue,
    this.paddingVerticalValue,
    this.borderRadiusValue,
    this.suffixIcon,
    this.borderColor,
    this.errorStyle,
    this.countryStyle,
    this.hintStyle,
    this.valueStyle,
    this.suffixIconConstraints,
    this.readOnly = false,
    this.enableFocusBorderColor = false,
  });

  @override
  State<CustomTextPhoneField> createState() => _CustomTextPhoneFieldState();
}

class _CustomTextPhoneFieldState extends State<CustomTextPhoneField> {
  late PhoneFieldController phoneCtrl;
  late TextEditingController controller;
  late FocusNode focusNode;

  void _controllerListener() {
    setState(() {});
  }

  void _focusListener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    phoneCtrl = widget.phoneFieldController..addListener(_controllerListener);
    controller = phoneCtrl.controller;
    if (widget.enableFocusBorderColor) {
      focusNode = FocusNode();
      focusNode.addListener(_focusListener);
    } else {
      focusNode = FocusNode();
    }
  }

  @override
  void dispose() {
    if (widget.enableFocusBorderColor) {
      focusNode.removeListener(_focusListener);
    }
    focusNode.dispose();
    phoneCtrl.removeListener(_controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 22.5.w,
                  vertical: 13.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadiusValue ?? 16.r,
                  ),
                  border: Border.all(color: borderColor(), width: 0.5.w),
                ),
                child: Row(
                  textDirection: TextDirection.ltr,
                  children: [
                    SvgPicture.asset(
                      AppAssets.saudi,
                      height: 18.h,
                      width: 24.w,
                    ),
                    widthSpace(9.w),
                    Text(
                      '+966',
                      style:
                          widget.countryStyle ??
                          AppTextStyles.textStyle12.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
              widthSpace(16.w),
              Expanded(
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  readOnly: widget.readOnly,
                  style: widget.valueStyle ?? AppTextStyles.textStyle16,
                  onChanged: (value) {
                    phoneCtrl.validatePhoneField();
                  },
                  onTapOutside: (_) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        widget.borderRadiusValue ?? 16.r,
                      ),
                      borderSide: BorderSide(
                        color: borderColor(),
                        width: 0.5.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        widget.borderRadiusValue ?? 16.r,
                      ),
                      borderSide: BorderSide(
                        color: borderColor(),
                        width: 0.5.w,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        widget.borderRadiusValue ?? 16.r,
                      ),
                      borderSide: BorderSide(
                        color: borderColor(),
                        width: 0.5.w,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        widget.borderRadiusValue ?? 16.r,
                      ),
                      borderSide: BorderSide(
                        color: borderColor(),
                        width: 0.5.w,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        widget.borderRadiusValue ?? 16.r,
                      ),
                      borderSide: BorderSide(
                        color: borderColor(),
                        width: 0.5.w,
                      ),
                    ),
                    hintText: LocaleKeys.phoneHint.tr(),
                    hintStyle:
                        widget.hintStyle ??
                        AppTextStyles.textStyle16.copyWith(
                          color: AppColors.hintColor,
                        ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: widget.contentPaddingVerticalValue ?? 10.h,
                      horizontal: 20.w,
                    ),
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (phoneCtrl.phoneFieldBorder == PhoneFieldBorder.error) ...[
          heightSpace(10.h),
          Text(
            phoneCtrl.errorMessage,
            style:
                widget.errorStyle ??
                AppTextStyles.textStyle12.copyWith(
                  color: AppColors.redColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ],
    );
  }

  Color borderColor() {
    if (phoneCtrl.phoneFieldBorder == PhoneFieldBorder.error) {
      return AppColors.redColor;
    }

    if (widget.enableFocusBorderColor && focusNode.hasFocus) {
      return AppColors.blackColor;
    }

    switch (phoneCtrl.phoneFieldBorder) {
      case PhoneFieldBorder.initial:
        return widget.borderColor ?? AppColors.hintColor;
      case PhoneFieldBorder.validated:
        return widget.borderColor ?? AppColors.blackColor;
      case PhoneFieldBorder.error:
        return AppColors.redColor;
    }
  }
}
