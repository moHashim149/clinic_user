import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/di/di.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/features/profile/presentation/widgets/custom_delete_acc_widget.dart';
import 'package:brandy_user/features/profile/presentation/widgets/custom_logout_widget.dart';
import 'package:brandy_user/features/profile/presentation/widgets/custom_profile_general_info_widget.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../cubit/profile_cubit.dart';
import '../widgets/custom_profile_contact_and_share_widget.dart';
import '../widgets/custom_profile_header_widget.dart';
import '../widgets/custom_profile_policy_widget.dart';
import '../widgets/custom_profile_settings_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..fetchSettings(),
      child: Scaffold(
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            var cubit = context.read<ProfileCubit>();
            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace(24.h),
                    CustomProfileHeaderWidget(),
                    heightSpace(24.h),
                    if (cubit.token != null) ...[
                      Text(
                        LocaleKeys.generalData.tr(),
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.hintColor,
                        ),
                      ),
                      heightSpace(8.h),
                      CustomProfileGeneralInfoWidget(),
                      heightSpace(24.h),
                    ],
                    Text(
                      LocaleKeys.settings.tr(),
                      style: AppTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.hintColor,
                      ),
                    ),
                    heightSpace(8.h),
                    CustomProfileSettingsWidget(isAuth: cubit.token != null,onUpdate: () {
                      cubit.updateUi();
                    },),
                    heightSpace(24.h),
                    Text(
                      LocaleKeys.contactAndShare.tr(),
                      style: AppTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.hintColor,
                      ),
                    ),
                    heightSpace(8.h),
                    CustomProfileContactAndShareWidget(
                      androidLink: cubit.settingsModel?.androidUrl ?? "",
                      appleLink: cubit.settingsModel?.iosUrl ?? "",
                    ),
                    heightSpace(24.h),
                    Text(
                      LocaleKeys.legal.tr(),
                      style: AppTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.hintColor,
                      ),
                    ),
                    heightSpace(8.h),
                    CustomProfilePolicyWidget(),
                    heightSpace(24.h),
                    CustomLogoutWidget(isAuth: cubit.token != null),
                    if (cubit.token != null) ...[
                      heightSpace(24.h),
                      CustomDeleteAccWidget(),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
