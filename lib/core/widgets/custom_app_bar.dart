import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'custom_back_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool canPop;
  final List<Widget>? actions;
  final VoidCallback? onBack;
  final Widget? titleWidget;
  const CustomAppBar({
    super.key,
    this.title,
    this.canPop = true,
    this.actions,
    this.titleWidget,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.transparentColor,
      titleSpacing: 0,
      title: titleWidget ?? (title != null
          ? Text(
              title!,
              style: AppTextStyles.textStyle12.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
          : null),
      centerTitle: false,
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      forceMaterialTransparency: true,
      actions: actions,
      leading: canPop ? CustomBackWidget(onBack: onBack) : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.h);
}
