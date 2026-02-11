import 'package:brandy_user/features/auth/data/models/user_model.dart';
import 'package:brandy_user/features/chat/data/arguments/chat_arguments.dart';
import 'package:brandy_user/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/helpers/url_launcher_helper.dart';
import '../../../../core/util/extensions/navigation.dart';
import '../../../../core/util/routing/routes.dart';
import '../../../../core/widgets/custom_image_network.dart';
import '../../../store_details/presentation/widgets/custom_rounded_icon_widget.dart';

class CustomOrderCourierWidget extends StatelessWidget {
  final bool isDelivered;
  final UserModel courier;
  final int? chatId;
  const CustomOrderCourierWidget({
    super.key,
    required this.isDelivered,
    required this.courier,
    this.chatId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary4Color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsetsDirectional.only(
        top: 22.h,
        start: 12.w,
        end: 16.w,
        bottom: 22.h,
      ),
      child: isDelivered
          ? Row(
              children: [
                SvgPicture.asset(AppAssets.correct),
                widthSpace(12.w),
                Text(
                  LocaleKeys.deliveredBy.tr(namedArgs: {'name': courier.name}),
                  style: AppTextStyles.textStyle10.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                CustomImageNetwork(
                  image: courier.image,
                  radiusValue: 23.r,
                  heightImage: 46.h,
                  widthImage: 46.w,
                ),
                widthSpace(11.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courier.name,
                        style: AppTextStyles.textStyle10.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      heightSpace(2.h),
                      Text(
                        courier.email ?? "",
                        style: AppTextStyles.textStyle10.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                widthSpace(4.w),
                CustomRoundedIconWidget(
                  icon: AppAssets.call,
                  onTap: () {
                    UrlLauncherHelper.callPhoneNumber(courier.phone!);
                  },
                  color: AppColors.transparentColor,
                  padding: 8.r,
                ),
                widthSpace(8.w),
                CustomRoundedIconWidget(
                  icon: AppAssets.chat,
                  onTap: () {
                    if (chatId != null) {
                      context.pushWithNamed(
                        Routes.chatView,
                        arguments: ChatArguments(
                          chatId: chatId!,
                          courier: courier,
                        ),
                      );
                    }
                  },
                  color: AppColors.transparentColor,
                  padding: 8.r,
                ),
              ],
            ),
    );
  }
}
