import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows{
  static BoxShadow defaultShadow = BoxShadow(
    color: AppColors.blackColor.withOpacity(0.1),
    blurRadius: 8,
    offset: Offset(0, 1),
    spreadRadius: 0,
  );

}