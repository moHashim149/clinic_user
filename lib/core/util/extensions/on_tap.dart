import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

extension WidgetExtension on Widget {
  Widget onTap({required void Function() function}) {
    return GestureDetector(
      onTap: function,
      child: this,
    );
  }

  Widget onTapShadow({double? borderRadiusValue, required VoidCallback function}) {
    return InkWell(
      onTap: function,
      borderRadius: borderRadiusValue != null ? BorderRadius.circular(borderRadiusValue) : null,
      splashColor: AppColors.transparentColor,
      highlightColor: AppColors.transparentColor,
      child: this,
    );
  }
}
