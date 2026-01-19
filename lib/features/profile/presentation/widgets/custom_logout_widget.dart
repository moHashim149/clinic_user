import 'package:brandy_user/features/profile/presentation/widgets/custom_logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../views/profile_view.dart';
import 'custom_profile_item_widget.dart';

class CustomLogoutWidget extends StatelessWidget {
  const CustomLogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary4Color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 20.h,
      ),
      child: CustomProfileItemWidget(
        icon: AppAssets.logout,
        title: "تسجيل الخروج",
        onTap: () {
          showDialog(context: context, builder: (context) {
            return CustomLogoutDialog(isLoading: false, onTapLogout: (){});
          },);
        },
      ),
    );
  }
}
