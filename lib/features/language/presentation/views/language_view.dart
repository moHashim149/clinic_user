import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:brandy_user/features/language/data/arguments/language_arguments.dart';
import 'package:brandy_user/features/language/presentation/cubit/language_cubit.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_language_header_widget.dart';

class LanguageView extends StatefulWidget {
  final LanguageArguments arguments;
  const LanguageView({super.key, required this.arguments});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    context.read<LanguageCubit>().getCurrentLang(context: context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          var cubit = context.read<LanguageCubit>();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace(24.h),
                CustomLanguageHeaderWidget(),
                heightSpace(40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            AppAssets.saudi,
                            width: 112.w,
                            height: 84.h,
                          ),
                          heightSpace(16.h),
                          Text(
                            LocaleKeys.arabic.tr(),
                            style: AppTextStyles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cubit.currentLangIndex == 0
                                  ? AppColors.primaryColor
                                  : AppColors.blackTextEighthColor,
                            ),
                          ),
                        ],
                      ).onTap(
                        function: () {
                          cubit.saveChanges(context, 0, widget.arguments);
                        },
                      ),
                      Spacer(),
                      Column(
                        children: [
                          SvgPicture.asset(
                            AppAssets.united,
                            width: 112.w,
                            height: 84.h,
                          ),
                          heightSpace(16.h),
                          Text(
                            "English",
                            style: AppTextStyles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cubit.currentLangIndex == 1
                                  ? AppColors.primaryColor
                                  : AppColors.blackTextEighthColor,
                            ),
                          ),
                        ],
                      ).onTap(
                        function: () {
                          cubit.saveChanges(context, 1, widget.arguments);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
