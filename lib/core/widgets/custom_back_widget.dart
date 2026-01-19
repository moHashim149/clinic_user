import 'package:brandy_user/core/constants/app_assets.dart';
import 'package:brandy_user/core/util/extensions/directionality.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../util/extensions/navigation.dart';

class CustomBackWidget extends StatelessWidget {
  final VoidCallback? onBack;
  const CustomBackWidget({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onBack != null) {
          onBack!();
        } else {
          context.pop();
        }
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..scale(context.isArabic ? 1.0 : -1.0, 1.0),
        child: SvgPicture.asset(AppAssets.arrowBack, fit: BoxFit.scaleDown),
      ),
    );
  }
}
