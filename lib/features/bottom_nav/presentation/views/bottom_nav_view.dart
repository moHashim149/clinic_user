import 'package:brandy_user/features/bottom_nav/presentation/views/widgets/custom_bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../cubit/bottom_nav_cubit.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final cubit = context.read<BottomNavCubit>();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border(
                top: BorderSide(color: AppColors.strokeColor, width: 0.5.w),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 42.w, vertical: 13.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(cubit.bottomNavigationBarItems.length, (
                index,
              ) {
                return CustomBottomBarItem(
                  icon: cubit.bottomNavigationBarItems[index].icon,
                  index: index,
                  title: cubit.bottomNavigationBarItems[index].title,
                );
              }),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
