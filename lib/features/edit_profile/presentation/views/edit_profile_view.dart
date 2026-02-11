import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/app_validator.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:brandy_user/core/widgets/custom_button.dart';
import 'package:brandy_user/core/widgets/custom_text_form_field.dart';
import 'package:brandy_user/features/auth/presentation/widgets/create_acc_widgets/custom_profile_picker_widget.dart';
import 'package:brandy_user/features/auth/presentation/widgets/login_widgets/custom_field_phone_widget.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../cubit/edit_profile_cubit.dart';
import '../widgets/custom_edit_profile_header_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      persistentFooterDecoration: BoxDecoration(),
      persistentFooterButtons: [
        BlocBuilder<EditProfileCubit, EditProfileState>(
          builder: (context, state) {
            var cubit = context.read<EditProfileCubit>();
            if (cubit.userModel != null) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 33.h),
                child: CustomButton(
                  isLoading: state is EditProfileLoading,
                  onPressed: () {
                    cubit.editProfile(context: context);
                  },
                  text: LocaleKeys.saveChanges.tr(),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
      body: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          final cubit = context.read<EditProfileCubit>();
          if (state is DataLoading) {
            return CustomLoading();
          } else if (state is DataFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                cubit.fetchProfile();
              },
            );
          } else {
            return AbsorbPointer(
              absorbing: state is EditProfileLoading,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heightSpace(24.h),
                      CustomEditProfileHeaderWidget(),
                      heightSpace(32.h),
                      CustomProfilePickerWidget(
                        pickImage: () {
                          cubit.pickImage();
                        },
                        pickedImage: cubit.userImage,
                        profileImage: cubit.userModel!.image,
                        width: 103.w,
                        height: 103.h,
                        borderWidth: 0.99.w,
                        editWidth: 32.w,
                        editHeight: 32.h,
                        editBorderWidth: 2.w,
                      ),
                      heightSpace(4.h),
                      Text(
                        LocaleKeys.fullName.tr(),
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackTextEighthColor,
                        ),
                      ),
                      heightSpace(8.h),
                      CustomTextFormField(
                        borderColor: AppColors.hintColor,
                        fillColor: AppColors.whiteColor,
                        keyboardType: TextInputType.name,
                        ctrl: cubit.nameController,
                        validator: AppValidator.nameValidator,
                        prefixIcon: SvgPicture.asset(
                          AppAssets.user,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      heightSpace(24.h),
                      Text(
                        LocaleKeys.email.tr(),
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackTextEighthColor,
                        ),
                      ),
                      heightSpace(8.h),
                      CustomTextFormField(
                        borderColor: AppColors.hintColor,
                        fillColor: AppColors.whiteColor,
                        keyboardType: TextInputType.emailAddress,
                        ctrl: cubit.emailController,
                        validator: AppValidator.fullEmailValidator,
                        prefixIcon: SvgPicture.asset(
                          AppAssets.email,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      heightSpace(24.h),
                      Text(
                        LocaleKeys.phoneNumber.tr(),
                        style: AppTextStyles.textStyle12.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackTextEighthColor,
                        ),
                      ),
                      heightSpace(8.h),
                      CustomFieldPhoneWidget(
                        phoneController: cubit.phoneCtrl,
                        borderColor: AppColors.hintColor,
                        enabled: false,
                        fillColor: AppColors.whiteColor,
                        suffixWidget: SvgPicture.asset(
                          AppAssets.lock,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
