import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:brandy_user/core/framework/spaces.dart';
import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/extensions/on_tap.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/core/widgets/custom_button.dart';
import 'package:brandy_user/features/auth/data/arguments/pin_code_argument.dart';
import 'package:brandy_user/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:brandy_user/features/cart/data/arguments/cart_arguments.dart';
import 'package:flutter/material.dart';

class LoginActionButtons extends StatelessWidget {
  final SignInCubit cubit;
  const LoginActionButtons({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: "ارسال كود",
          onPressed: () => cubit.sendCode(context),
        ),
        heightSpace(16),
        CustomButton(
          onPressed: () =>
              context.pushWithNamed(Routes.createServiceProviderAccount),
          text: "تسجيل دخول كمقدم خدمه",
          backgroundColor: Colors.transparent,
          borderColor: AppColors.primary,
          txtColor: AppColors.primary,
        ),
        heightSpace(16),
        CustomButton(
          onPressed: () => context.pushWithNamed(Routes.createAccount),
          text: "انشاء حساب",
          backgroundColor: Colors.transparent,
          borderColor: AppColors.primary,
          txtColor: AppColors.primary,
        ),
        heightSpace(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "الدخول كزائر",
            style: AppTextStyles.textStyle18w700.copyWith(
              color: AppColors.primary,
            ),
          ),
        ).onTapShadow(
          function: () {
            context.pushWithNamed(Routes.cartView, arguments: CartArguments());
          },
        ),
      ],
    );
  }
}
