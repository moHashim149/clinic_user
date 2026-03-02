import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../cubit/search_places_cubit/search_places_bloc.dart';

class CustomSearchLocationTextFieldWidget extends StatefulWidget {
  final SearchPlacesBloc bloc;

  const CustomSearchLocationTextFieldWidget({super.key, required this.bloc});

  @override
  State<CustomSearchLocationTextFieldWidget> createState() =>
      _CustomSearchLocationTextFieldWidgetState();
}

class _CustomSearchLocationTextFieldWidgetState
    extends State<CustomSearchLocationTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: widget.bloc.searchCtrl,
      textAlign: TextAlign.right,
      style: AppTextStyles.textStyle14.copyWith(color: AppColors.blackColor),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: (value) {
        widget.bloc.add(GetPlacesSuggestionsEvent(searchQuery: value));
      },
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Image.asset(AppAssets.searchLocationIcon, fit: BoxFit.scaleDown, color: AppColors.blackColor,width: 16,height: 16),
        ),
        hintText: "ابحث عن موقعك....",
        filled: true,
        hintStyle: AppTextStyles.textStyle12.copyWith(
          color: AppColors.hintColor,
        ),
        fillColor: AppColors.whiteColor,
        border: buildOutlineInputBorder(),
        disabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(), 
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.stroke),
      borderRadius: BorderRadius.circular(30.r),
    );
  }
}
