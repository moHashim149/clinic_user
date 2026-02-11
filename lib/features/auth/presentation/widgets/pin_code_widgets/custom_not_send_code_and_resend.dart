import 'dart:async';
import 'package:brandy_user/features/auth/data/params/send_code_param.dart';
import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/widgets.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../../../../core/util/extensions/on_tap.dart';
import '../../../data/arguments/pin_code_argument.dart';
import '../../cubits/pin_code_cubit/pin_code_cubit.dart';

class CustomNotSendCodeAndResend extends StatefulWidget {
  final PinCodeCubit cubit;
  final PinCodeArgument argument;

  const CustomNotSendCodeAndResend({
    super.key,
    required this.cubit,
    required this.argument,
  });

  @override
  State<CustomNotSendCodeAndResend> createState() =>
      _CustomNotSendCodeAndResendState();
}

class _CustomNotSendCodeAndResendState
    extends State<CustomNotSendCodeAndResend> {
  var interval = const Duration(seconds: 1);
  int timerMaxSeconds = 60;
  int currentSeconds = 0;
  late Timer timer;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  bool get isFinish => currentSeconds >= timerMaxSeconds;

  void startTimer() {
    Timer.periodic(interval, (time) {
      timer = time;
      currentSeconds = timer.tick;
      if (timer.tick >= timerMaxSeconds) {
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${LocaleKeys.resendCodeQuestion.tr()}\t",
          style: AppTextStyles.textStyle14.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.blackTextEighthColor,
          ),
        ),
        if (!isFinish)
          Text(
            timerText,
            textDirection: TextDirection.ltr,
            style: AppTextStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
        if (isFinish)
          Text(
            LocaleKeys.resend.tr(),
            style: AppTextStyles.textStyle14.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ).onTap(
            function: () {
              widget.cubit.sendCode(
                timer: startTimer,
                param: SendCodeParam(phone: widget.argument.phone, type: 1),
              );
            },
          ),
      ],
    );
  }
}
