

part of 'widgets_imports.dart';


class OnboardingActionButtons extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnboardingActionButtons({
    super.key,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child:  Text(
              'التالي',
              style: AppTextStyles.buttonLabel,
            ),
          ),
        ),
        heightSpace(12),
        TextButton(
          onPressed: onSkip,
          child:  Text(
            'تخطي',
            style: AppTextStyles.textButtonLabel,
          ),
        ),
      ],
    );
  }
}
