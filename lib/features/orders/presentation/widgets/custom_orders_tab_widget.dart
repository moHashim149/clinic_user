import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/util/extensions/media_query.dart';

class CustomOrdersTabWidget extends StatelessWidget {
  const CustomOrdersTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Container(
        width: context.width,
        color: AppColors.greyThirdColor,
        child: TabBar(
          tabs: List.generate(6, (index) => Tab(text: "جديد")),
          isScrollable: true,
          indicatorColor: AppColors.primaryColor,
          dividerHeight: 0,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          labelColor: AppColors.primaryColor,
          labelStyle: AppTextStyles.textStyle12.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
          unselectedLabelStyle: AppTextStyles.textStyle12
              .copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.blackTextEighthColor,
          ),
          tabAlignment: TabAlignment.start,
          unselectedLabelColor: AppColors.blackTextEighthColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 4,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 4.w,
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8.r),
            ),
          ),
        ),
      ),
    );
  }
}
