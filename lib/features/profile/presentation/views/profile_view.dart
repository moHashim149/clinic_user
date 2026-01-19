import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/di/di.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/features/profile/presentation/widgets/custom_delete_acc_widget.dart';
import 'package:brandy_user/features/profile/presentation/widgets/custom_logout_widget.dart';
import 'package:brandy_user/features/profile/presentation/widgets/custom_profile_general_info_widget.dart';
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
      create: (context) => getIt<ProfileCubit>(),
      child: Scaffold(
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final cubit = context.read<ProfileCubit>();
            if (state is ProfileLoading) {
              return CustomLoading();
            } else if (state is ProfileFailure) {
              return CustomError(
                error: state.error,
                retry: () {
                  // cubit.fetchHome();
                },
              );
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heightSpace(24.h),
                      CustomProfileHeaderWidget(),
                      heightSpace(24.h),
                      Text(
                        "بيانات عامة",
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.hintColor,
                        ),
                      ),
                      heightSpace(8.h),
                      CustomProfileGeneralInfoWidget(),
                      heightSpace(24.h),
                      Text(
                        "الاعدادات",
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.hintColor,
                        ),
                      ),
                      heightSpace(8.h),
                      CustomProfileSettingsWidget(),
                      heightSpace(24.h),
                      Text(
                        "التواصل والمشاركة",
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.hintColor,
                        ),
                      ),
                      heightSpace(8.h),
                      CustomProfileContactAndShareWidget(),
                      heightSpace(24.h),
                      Text(
                        "قانوني",
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.hintColor,
                        ),
                      ),
                      heightSpace(8.h),
                      CustomProfilePolicyWidget(),
                      heightSpace(24.h),
                      CustomLogoutWidget(),
                      heightSpace(24.h),
                      CustomDeleteAccWidget()
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}


