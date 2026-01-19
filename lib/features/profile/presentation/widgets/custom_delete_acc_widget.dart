import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import 'custom_delete_acc_dialog.dart';

class CustomDeleteAccWidget extends StatelessWidget {
  const CustomDeleteAccWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return CustomDeleteAccDialog(
                isLoading: false,
                onTapDeleteAcc: () {},
              );
            },
          );
        },
        icon: SvgPicture.asset(
          AppAssets.trash,
          color: AppColors.redFourthColor,
          width: 20.w,
          height: 20.h,
        ),
        label: Text(
          "حذف الحساب",
          style: AppTextStyles.textStyle12.copyWith(
            color: AppColors.redFourthColor,
          ),
        ),
      ),
    );
  }
}
