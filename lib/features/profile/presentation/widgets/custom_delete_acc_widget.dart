import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../cubit/profile_cubit.dart';
import 'custom_delete_acc_dialog.dart';

class CustomDeleteAccWidget extends StatelessWidget {
  const CustomDeleteAccWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return BlocProvider.value(
                value: context.read<ProfileCubit>(),
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    var cubit = context.read<ProfileCubit>();
                    return CustomDeleteAccDialog(
                      isLoading: state is DeleteAccLoading,
                      onTapDeleteAcc: () {
                        cubit.deleteAcc(context: context);
                      },
                    );
                  },
                ),
              );
            },
          );
        },
        icon: SvgPicture.asset(
          AppAssets.trash,
          color: AppColors.redFourthColor,
          width: 20.w,
          height: 20.h,
        ),
        label: Text(
          LocaleKeys.deleteAccount.tr(),
          style: AppTextStyles.textStyle12.copyWith(
            color: AppColors.redFourthColor,
          ),
        ),
      ),
    );
  }
}
