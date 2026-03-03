import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectCountryWidget extends StatelessWidget {
  final SignInCubit cubit;
  const SelectCountryWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
    children: [
      widthSpace(2),
      Container(
        color: AppColors.stroke,
        height: 30.h,
        width: 1.2.w,
      ),
      widthSpace(8),
      InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ValueListenableBuilder(
            valueListenable: cubit.countryValue,
            builder: (context, value, child) {
              return Row(
                children: [
                  Text(
                    value!=null ? getCode(context,value) : "+966",
                    style: AppTextStyles.textStyle12w500.copyWith(
                        color: AppColors.darkGray
                    ),
                  ),
                  widthSpace(9),
                  Text(
                    value?.flagEmoji ?? "🇸🇦",
                    style: AppTextStyles.textStyle18,
                  ),
                  widthSpace(4),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18,
                    color: AppColors.darkGray,
                  ),
                ],
              );
            },
          ),
        ).onTap(
          function: () => cubit.openCountryPicker(context),
        ),
      ),
      widthSpace(8),
    ],
    );
  }

  String getCode(BuildContext context, Country country){
    var isRtl = Directionality.of(context) == TextDirection.rtl;
   return '${isRtl ? '' : '+'}${country.phoneCode}${isRtl ? '+' : ''}';
  }


}
