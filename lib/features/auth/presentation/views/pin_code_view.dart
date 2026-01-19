import 'package:brandy_user/core/widgets/custom_app_bar.dart';
import 'package:brandy_user/features/auth/data/arguments/create_acc_argument.dart';
import 'package:brandy_user/features/auth/presentation/widgets/login_widgets/custom_header_login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import '../../data/arguments/pin_code_argument.dart';
import '../cubits/pin_code_cubit/pin_code_cubit.dart';
import '../widgets/pin_code_widgets/custom_code_sent_success_widget.dart';
import '../widgets/pin_code_widgets/custom_not_send_code_and_resend.dart';
import '../widgets/pin_code_widgets/custom_pin_code_widget.dart';

class PinCodeView extends StatelessWidget {
  final PinCodeArgument argument;

  const PinCodeView({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: BlocBuilder<PinCodeCubit, PinCodeState>(
          builder: (context, state) {
            final cubit = context.read<PinCodeCubit>();
            return AbsorbPointer(
              absorbing: state is PinCodeLoading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAuthHeader(
                    title: "أدخل رمز التحقق",
                    body: "لقد قمنا بإرسال كود التحقق الى",
                  ),
                  heightSpace(8.h),
                  CustomCodeSentSuccessWidget(
                    credential: argument.credential,
                    isEmail: argument.isEmail,
                  ),
                  heightSpace(32.h),
                  Text(
                    "أدخل الرقم المكون من 4 أرقام",
                    style: AppTextStyles.textStyle14.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackTextEighthColor,
                    ),
                  ),
                  heightSpace(15.h),
                  CustomPinCodeWidget(
                    controller: cubit.pinCtrl,
                    formKey: cubit.formKey,
                    onSubmitted: (value) {
                      // cubit.checkOtp(
                      //   context: context,
                      //   param: CheckOtpParam(
                      //     phone: argument.phone,
                      //     otp: value!,
                      //   ),
                      // );
                    },
                  ),
                  heightSpace(24.h),
                  CustomNotSendCodeAndResend(cubit: cubit, argument: argument),
                  heightSpace(54.h),
                  CustomButton(
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        // cubit.checkOtp(
                        //   context: context,
                        //   param: CheckOtpParam(
                        //     phone: argument.phone,
                        //     otp: cubit.pinCtrl.text,
                        //   ),
                        // );
                        context.pushWithNamed(Routes.createAccountView,arguments: CreateAccArgument(credential: argument.credential));
                      }
                    },
                    isLoading: state is PinCodeLoading,
                    text: LocaleKeys.verify.tr(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
