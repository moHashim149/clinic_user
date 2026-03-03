part of 'create_account_widgets_imports.dart';

class CreateAccountTerms extends StatelessWidget {
  final ValueNotifier<bool> acceptTermsNotifier;

  const CreateAccountTerms({
    super.key,
    required this.acceptTermsNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: acceptTermsNotifier,
          builder: (context, acceptTerms, _) {
            return SizedBox(
              width: 26.w,
              height: 26.w,
              child: Checkbox(
                value: acceptTerms,
                onChanged: (val) => acceptTermsNotifier.value = val ?? false,
                activeColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                side: const BorderSide(color: AppColors.primary),
              ),
            );
          },
        ),
        widthSpace(8.w),
        RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
            text: "بإنشاء حسابك، فإنك توافق على ",
            style: AppTextStyles.textStyle12.copyWith(
              color: AppColors.blackTextEighthColor,
              fontWeight: FontWeight.w600
            ),
            children: [
              TextSpan(
                text: "الشروط والأحكام",
                style: AppTextStyles.textStyle12.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
