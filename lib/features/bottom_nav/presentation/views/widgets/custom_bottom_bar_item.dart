import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/util/extensions/on_tap.dart';
import '../../../../../core/widgets/custom_visitor_widget.dart';
import '../../cubit/bottom_nav_cubit.dart';

class CustomBottomBarItem extends StatelessWidget {
  final String icon, title;
  final int index;

  const CustomBottomBarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BottomNavCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          icon,
          height: 24.h,
          width: 24.w,
          color: cubit.currentIndex == index ? AppColors.primaryColor : null,
        ),
        heightSpace(4.h),
        Text(
          title.tr(),
          style: AppTextStyles.textStyle6.copyWith(
            fontWeight: FontWeight.bold,
            color: cubit.currentIndex == index
                ? AppColors.primaryColor
                : AppColors.graySecondaryColor,
          ),
        ),
      ],
    ).onTapShadow(
      function: () {
        if (cubit.token != null) {
          cubit.changeNavIndex(index: index);
        } else {
          if (index == 3) {
            if (context.mounted) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                builder: (context) {
                  return CustomVisitorWidget();
                },
              );
            }
          } else {
            cubit.changeNavIndex(index: index);
          }
        }
      },
    );
  }
}
