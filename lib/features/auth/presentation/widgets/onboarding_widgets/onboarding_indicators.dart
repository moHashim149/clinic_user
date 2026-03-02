import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingIndicators extends StatelessWidget {
  final int count;
  final int activeIndex;

  const OnboardingIndicators({
    super.key,
    required this.count,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == activeIndex ? AppColors.primary : AppColors.indicatorInactive,
          ),
        ),
      ),
    );
  }
}
