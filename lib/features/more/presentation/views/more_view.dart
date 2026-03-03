import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/features/more/presentation/widgets/more_help_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "المساعده و الدعم",
                style: AppTextStyles.textStyle16.copyWith(
                  color: AppColors.headline,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.h),
              MoreHelpItem(
                icon: AppAssets.infoIcon,
                title: "عن التطبيق",
                onTap: () {},
              ),
              MoreHelpItem(
                icon: AppAssets.termsIcon,
                title: "الشروط والاحكام",
                onTap: () {},
              ),
              MoreHelpItem(
                icon: AppAssets.faqIcon,
                title: "الاسئلة الشائعة",
                onTap: () {},
              ),
              MoreHelpItem(
                icon: AppAssets.communicateIcon,
                title: "تواصل معنا",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
