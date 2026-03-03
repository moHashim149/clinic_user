import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  final String assetPath;

  const SplashLogo({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Image.asset(
        height: 444,
        width: 243,
        assetPath,
        fit: BoxFit.contain,
      ),
    );
  }
}

