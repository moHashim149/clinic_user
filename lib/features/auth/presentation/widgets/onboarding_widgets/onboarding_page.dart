import 'package:flutter/material.dart';
import '../onboarding_imports.dart';

class OnboardingPageData {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingPageData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingPageData data;
  final int activeIndex;

  const OnboardingPage({
    super.key,
    required this.data,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 1),
        OnboardingImage(imagePath: data.imagePath),
        const Spacer(flex: 1),
        OnboardingIndicators(count: 3, activeIndex: activeIndex),
        const SizedBox(height: 18),
        OnboardingContent(
          title: data.title,
          subtitle: data.description,
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}