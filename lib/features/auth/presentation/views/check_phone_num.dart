
import 'package:brandy_user/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../data/arguments/pin_code_argument.dart';

class CheckPhoneNum extends StatefulWidget {
  final PinCodeArgument argument;
  const CheckPhoneNum({super.key, required this.argument});

  @override
  State<CheckPhoneNum> createState() => _CheckPhoneNumState();
}

class _CheckPhoneNumState extends State<CheckPhoneNum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: SizedBox.shrink(),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: IconButton(
                icon: const Icon(Icons.chevron_right, color: AppColors.primary),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height -
                  MediaQuery.paddingOf(context).top -
                  kToolbarHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "التحقق من رقم الجوال",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.5,
                        fontFamily: 'Cairo',
                      ),
                      children: [
                        TextSpan(text: "تم إرسال رمز التحقق الى الرقم "),
                        TextSpan(
                          text: "055985698",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        TextSpan(text: ". أدخل الرمز"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // OTP Input Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => Container(
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFFFE),
                          borderRadius: BorderRadius.circular(16),
                          border:
                              Border.all(color: AppColors.primary),
                        ),
                        alignment: Alignment.center,
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary
                          ),
                          decoration: const InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                          ),
                            onChanged: (value) {
                              if (value.length == 1) {
                                if (index < 3) {
                                  FocusScope.of(context).nextFocus();
                                }
                              }
                            }

                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "اعد الارسال بعد 01:00",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      const Text(
                        " لم يصلك رمز؟",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "تاكيد",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 267),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}