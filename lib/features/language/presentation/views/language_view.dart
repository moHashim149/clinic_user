import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_language_header_widget.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace(24.h),
            CustomLanguageHeaderWidget(),
            heightSpace(40.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 28.w),
              child: Row(
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(AppAssets.saudi,width: 112.w,height: 84.h,),
                      heightSpace(16.h),
                      Text("العربية",style: AppTextStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackTextEighthColor,
                      ),)
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      SvgPicture.asset(AppAssets.united,width: 112.w,height: 84.h,),
                      heightSpace(16.h),
                      Text("English",style: AppTextStyles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackTextEighthColor,
                      ),)
                    ],
                  ),


                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
