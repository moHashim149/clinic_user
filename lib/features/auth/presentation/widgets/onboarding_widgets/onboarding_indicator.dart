import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class OnboardingIndicator extends StatelessWidget {
  final int totalDots;
  final int activeIndex;

  const OnboardingIndicator({
    super.key,
    this.totalDots = 3,
    this.activeIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalDots,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
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
