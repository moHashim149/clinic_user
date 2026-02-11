import 'package:brandy_user/core/util/extensions/navigation.dart';
import 'package:brandy_user/core/util/routing/routes.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';

class CustomAcceptTermsAndCondWidget extends StatelessWidget {
  const CustomAcceptTermsAndCondWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "${LocaleKeys.agreeToTermsFullText.tr()}\t",
        style: AppTextStyles.textStyle12.copyWith(
          color: AppColors.blackTextEighthColor,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: LocaleKeys.terms.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              decorationColor: AppColors.primaryColor,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushWithNamed(Routes.termsView);
              },
          ),
          TextSpan(
            text: "\t${LocaleKeys.and.tr()}\t",
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.blackTextEighthColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: LocaleKeys.privacyPolicy.tr(),
            style: AppTextStyles.textStyle12.copyWith(
              decorationColor: AppColors.primaryColor,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushWithNamed(Routes.policyView);
              },
          ),
          TextSpan(
            text: "\t${LocaleKeys.forBrandyApp.tr()}",
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.blackTextEighthColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
