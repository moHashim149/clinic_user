import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

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
        // Primary Button (Next)
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
            child: const Text(
              'التالي',
              style: AppTextStyles.buttonLabel,
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Text Button (Skip)
        TextButton(
          onPressed: onSkip,
          child: const Text(
            'تخطي',
            style: AppTextStyles.textButtonLabel,
          ),
        ),
      ],
    );
  }
}
