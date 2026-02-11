import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../cubit/select_language_cubit.dart';
import '../widgets/custom_select_language_item_widget.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: BlocBuilder<SelectLanguageCubit, SelectLanguageState>(
            builder: (context, state) {
              var cubit = context.read<SelectLanguageCubit>();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      LocaleKeys.selectLanguage.tr(),
                      style: AppTextStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  heightSpace(32.h),
                  Text(
                    LocaleKeys.pleaseSelectLanguage.tr(),
                    style: AppTextStyles.textStyle16.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackTextFifthColor,
                    ),
                  ),
                  heightSpace(24.h),
                  CustomSelectLanguageItemWidget(
                    flag: AppAssets.saudi,
                    language: LocaleKeys.arabic.tr(),
                    isSelected: 0 == cubit.selectedIndex,
                    onTap: () {
                      context.read<SelectLanguageCubit>().changeIndex(index: 0);
                      context.read<SelectLanguageCubit>().saveChanges(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Divider(thickness: 1, color: AppColors.dividerColor),
                  ),
                  CustomSelectLanguageItemWidget(
                    flag: AppAssets.united,
                    language: "English",
                    isSelected: 1 == cubit.selectedIndex,
                    onTap: () {
                      context.read<SelectLanguageCubit>().changeIndex(index: 1);
                      context.read<SelectLanguageCubit>().saveChanges(context);
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
