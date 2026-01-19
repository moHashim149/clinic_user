import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/framework/app_validator.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/core/widgets/custom_text_form_field.dart';
import 'package:brandy_user/features/auth/data/arguments/pin_code_argument.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/locale_keys.g.dart';

import '../../../../core/util/extensions/media_query.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../widgets/login_widgets/custom_field_phone_widget.dart';
import '../widgets/login_widgets/custom_header_login.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          final cubit = context.read<SignInCubit>();
          return SafeArea(
            child: AbsorbPointer(
              absorbing: state is SignInLoading,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    CustomAuthHeader(
                      title: "مرحباً بك في دليلك لأقرب وأشهر المتاجر! 👋",
                      body:
                          "سجّل الآن واكتشف متاجرك المفضلة القريبة، واطلب بخطوة واحدة!",
                    ),
                    heightSpace(32.h),
                    Text(
                      cubit.isEmail
                          ? LocaleKeys.email.tr()
                          : LocaleKeys.phoneNumber.tr(),
                      style: AppTextStyles.textStyle12.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackTextEighthColor,
                      ),
                    ),
                    heightSpace(8.h),
                    if (cubit.isEmail)
                      Form(
                        key: cubit.formKey,
                        child: CustomTextFormField(
                          fillColor: AppColors.whiteColor,
                          hintText: "أدخل البريد الإلكتروني",
                          hintStyle: AppTextStyles.textStyle12.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.hintColor,
                          ),
                          ctrl: cubit.emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          validator: AppValidator.fullEmailValidator,
                          prefixIcon: SvgPicture.asset(
                            AppAssets.email,
                            width: 20.w,
                            height: 20.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    if (!cubit.isEmail)
                      CustomFieldPhoneWidget(phoneController: cubit.phoneCtrl),
                    heightSpace(context.height * 0.15),
                    CustomButton(
                      onPressed: () {
                        bool isFormValidated =
                            cubit.phoneCtrl.validatePhoneField() ||
                            (cubit.formKey.currentState?.validate() ?? false);

                        if (isFormValidated) {
                          // cubit.signIn(context: context);
                          context.pushWithNamed(
                            Routes.pinCodeView,
                            arguments: PinCodeArgument(
                              credential: cubit.isEmail
                                  ? cubit.emailCtrl.text
                                  : cubit.phoneCtrl.controller.text,
                              isEmail: cubit.isEmail,
                            ),
                          );
                        }
                      },
                      text: LocaleKeys.login.tr(),
                      isLoading: state is SignInLoading,
                    ),
                    heightSpace(48.h),
                    Row(
                      children: [
                        Expanded(child: Divider(color: AppColors.strokeColor)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Text(
                            "أو",
                            style: AppTextStyles.textStyle16.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.hintColor,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: AppColors.strokeColor)),
                      ],
                    ),
                    heightSpace(48.h),
                    CustomButton(
                      onPressed: () {
                        cubit.toggleCredentialType();
                      },
                      borderSide: BorderSide(color: AppColors.strokeColor),
                      backgroundColor: AppColors.transparentColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            cubit.isEmail ? AppAssets.phone : AppAssets.email,
                          ),
                          widthSpace(10.w),
                          Text(
                            cubit.isEmail
                                ? "استمر عبر رقم الجوال"
                                : "استمر عبر البريد الإلكتروني",
                            style: AppTextStyles.textStyle16.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackTextEighthColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
