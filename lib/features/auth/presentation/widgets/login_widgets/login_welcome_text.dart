
import 'package:flutter/material.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "مرحباً بك في عائلتنا",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(height: 60),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "قم بتسجيل الدخول",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ],
    );
  }
}
