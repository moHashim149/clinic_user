import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';
import '../util/extensions/media_query.dart';

class CustomEmptyDataWidget extends StatelessWidget {
  final String? image, text;
  final double? height, width;

  const CustomEmptyDataWidget({
    super.key,
    this.image,
    this.text,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (image != null) ...[
            SvgPicture.asset(image!, height: height, width: width),
            heightSpace(11.h),
          ],
          Text(
            text ?? LocaleKeys.emptyData.tr(),
            style: AppTextStyles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
