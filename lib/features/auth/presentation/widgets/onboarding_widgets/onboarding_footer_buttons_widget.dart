part of 'widgets_imports.dart';

class OnboardingFooterButtonsWidget extends StatelessWidget {
  final void Function() onPressNext;
  final void Function() onPressSkip;

  const OnboardingFooterButtonsWidget({
    super.key,
    required this.onPressNext,
    required this.onPressSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnboardingPrimaryButton(
          label: 'التالي',
          onPressed: onPressNext,
        ),
        heightSpace(8),
        CustomButton(
          backgroundColor: Colors.transparent,
            text: "تخطي",
            txtColor: AppColors.primary,
            onPressed: onPressSkip
        ),
        heightSpace(40),
      ],
    );
  }
}
