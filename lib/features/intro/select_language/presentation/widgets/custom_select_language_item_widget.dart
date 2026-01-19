import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_text_styles.dart';
import '../cubit/select_language_cubit.dart';

class CustomSelectLanguageItemWidget extends StatelessWidget {
  final String flag;
  final String language;
  final bool isSelected;
  final void Function() onTap;


  const CustomSelectLanguageItemWidget({
    super.key,
    required this.flag,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          flag,
        ),
        widthSpace(10.w),
        Expanded(
          child: Text(
              language,
              style: AppTextStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.w600,
              )
          ),
        ),
        if (isSelected)
          Icon(
            Icons.check,
            color: AppColors.secondaryColor,
          ),
      ],
    ).onTap(function: onTap);
  }
}