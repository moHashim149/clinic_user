import 'package:flutter/material.dart';
import 'language_switcher.dart';

class OnboardingTopBar extends StatelessWidget {
  final VoidCallback? onLanguageTap;

  const OnboardingTopBar({super.key, this.onLanguageTap});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 34),
      child: Align(
        alignment: Alignment.centerLeft,
        child: LanguageSwitcher(),
      ),
    );
  }
}
