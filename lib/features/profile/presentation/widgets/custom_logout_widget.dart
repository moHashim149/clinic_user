import 'package:brandy_user/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:brandy_user/features/profile/presentation/widgets/custom_logout_dialog.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import '../views/profile_view.dart';
import 'custom_profile_item_widget.dart';

class CustomLogoutWidget extends StatelessWidget {
  final bool isAuth;
  const CustomLogoutWidget({super.key, required this.isAuth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary4Color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
      child: CustomProfileItemWidget(
        icon: AppAssets.logout,
        title: isAuth ? LocaleKeys.logout.tr() : LocaleKeys.login.tr(),
        onTap: () {
          if (isAuth) {
            showDialog(
              context: context,
              builder: (_) {
                return BlocProvider.value(
                  value: context.read<ProfileCubit>(),
                  child: BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      var cubit = context.read<ProfileCubit>();
                      return CustomLogoutDialog(
                        isLoading: state is LogOutLoading,
                        onTapLogout: () {
                          cubit.logOut(context: context);
                        },
                      );
                    },
                  ),
                );
              },
            );
          } else {
            context.pushAndRemoveUntilWithNamed(Routes.signInView);
          }
        },
      ),
    );
  }
}
