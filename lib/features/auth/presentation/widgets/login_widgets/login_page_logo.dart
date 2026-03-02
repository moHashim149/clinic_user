
import 'package:flutter/material.dart';

class LoginPageLogo extends StatelessWidget {
  const LoginPageLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/clinic_logo.png",
        height: 121,
        width: 139,
        fit: BoxFit.contain,
      ),
    );
  }
}