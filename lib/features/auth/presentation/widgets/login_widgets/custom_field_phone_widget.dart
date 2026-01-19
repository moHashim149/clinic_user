import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/helpers/custom_phone_controller.dart';
import '../../../../../../generated/locale_keys.g.dart';

class CustomFieldPhoneWidget extends StatefulWidget {
  final PhoneFieldController phoneController;
  final double? paddingVerticalValue, borderRadiusValue;
  final bool? isHide, enabled;
  final Color? fillColor, borderColor;
  final Widget? suffixWidget;

  const CustomFieldPhoneWidget({
    super.key,
    required this.phoneController,
    this.paddingVerticalValue,
    this.borderRadiusValue,
    this.isHide = false,
    this.enabled,
    this.fillColor,
    this.borderColor,
    this.suffixWidget,
  });

  @override
  State<CustomFieldPhoneWidget> createState() => _CustomFieldPhoneWidgetState();
}

class _CustomFieldPhoneWidgetState extends State<CustomFieldPhoneWidget> {
  late PhoneFieldController phoneCtrl;

  void _controllerListener() {
    setState(() {});
  }

  @override
  void initState() {
    phoneCtrl = widget.phoneController..addListener(_controllerListener);

    super.initState();
  }

  @override
  void dispose() {
    phoneCtrl = widget.phoneController..removeListener(_controllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: TextFormField(
            enabled: widget.enabled,
            controller: phoneCtrl.controller,
            style: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
            ),
            onChanged: (String? value) {
              if (value != null) {
                phoneCtrl.validatePhoneField();
              }
            },

            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],

            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '5xxxxxxxx',
              fillColor: widget.fillColor ?? AppColors.transparentColor,
              filled: true,
              enabled: widget.enabled ?? true,


              prefixIcon: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widthSpace(16.w),
                    SvgPicture.asset(AppAssets.saudi, height: 18.h,width: 24.w,),
                    widthSpace(9.w),
                    Text(
                      '+966',
                      style: AppTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    widthSpace(5.w),
                    SvgPicture.asset(AppAssets.arrowDown,fit: BoxFit.scaleDown,color: AppColors.blackColor,),
                    widthSpace(5.w),
                    VerticalDivider(
                      indent: 9.h,
                      endIndent: 9.h,
                      color: AppColors.strokeColor,
                    ),
                  ],
                ),
              ),
              hintStyle: AppTextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.hintColor,
              ),
              suffixIcon: widget.suffixWidget,
              contentPadding: EdgeInsets.symmetric(
                vertical: 9.h,
                horizontal: 20.w,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? borderColor(),
                ),
                borderRadius: BorderRadius.circular(
                  widget.borderRadiusValue ?? 12.r,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? borderColor(),
                ),
                borderRadius: BorderRadius.circular(
                  widget.borderRadiusValue ?? 12.r,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.redColor,
                ),
                borderRadius: BorderRadius.circular(
                  widget.borderRadiusValue ?? 12.r,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.borderColor ?? borderColor(),
                ),
                borderRadius: BorderRadius.circular(
                  widget.borderRadiusValue ?? 16.r,
                ),
              ),
              isDense: true,
            ),
          ),
        ),
        if (phoneCtrl.phoneFieldBorder == PhoneFieldBorder.error) ...[
          heightSpace(10),
          Text(
            phoneCtrl.errorMessage,
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.redColor,
            ),
          ),
        ],
      ],
    );
  }

  Color borderColor() {
    switch (phoneCtrl.phoneFieldBorder) {
      case PhoneFieldBorder.initial:
        return AppColors.hintColor;
      case PhoneFieldBorder.error:
        return AppColors.redColor;
      case PhoneFieldBorder.validated:
        return AppColors.hintColor;
    }
  }
}
