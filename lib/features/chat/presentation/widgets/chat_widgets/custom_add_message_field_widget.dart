import 'package:brandy_user/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/extensions/directionality.dart';
import '../../../../../core/util/extensions/media_query.dart';
import '../../../../../core/util/extensions/on_tap.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../data/arguments/chat_arguments.dart';
import '../../cubit/chat_cubit.dart';

class CustomAddMessageFieldWidget extends StatelessWidget {
  final ChatCubit cubit;
  final ChatArguments arguments;
  const CustomAddMessageFieldWidget({
    super.key,
    required this.cubit,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 16.h),
      child: Column(
        children: [
          if (cubit.image != null) ...[
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: context.width * 0.26, // 112.h,
                      height: context.height * 0.12, // 112.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(cubit.image!),
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      top: 8.h,
                      end: 8.w,
                      child:
                          SvgPicture.asset(
                            AppAssets.cancel,
                            width: 16.w,
                            height: 16.h,
                          ).onTap(
                            function: () {
                              cubit.removeImage();
                            },
                          ),
                    ),
                  ],
                ),
              ),
            ),
            heightSpace(5.h),
          ],
          CustomTextFormField(
            borderColor: AppColors.transparentColor,
            borderRadiusValue: 24.r,
            ctrl: cubit.messageController,
            readOnly: cubit.image != null,
            fillColor: AppColors.grayTwelfthColor,
            hintText: "هلا برسلك علامة مميزة اخرى",
            hintStyle: AppTextStyles.textStyle12.copyWith(
              fontWeight: FontWeight.w500,
            ),
            prefixIcon:
                SvgPicture.asset(
                  AppAssets.attachImage,
                  fit: BoxFit.scaleDown,
                ).onTapShadow(
                  borderRadiusValue: 25.r,
                  function: () {
                    cubit.selectImage();
                  },
                ),
            suffixIcon: AbsorbPointer(
              absorbing: cubit.state is SendMessageLoading,
              child:
                  Container(
                    width: 59.w,
                    height: 39.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..scale(context.isArabic ? 1.0 : -1.0, 1.0, 1.0),
                      child: SvgPicture.asset(
                        AppAssets.send,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ).onTapShadow(
                    borderRadiusValue: 25.r,
                    function: () {
                      // cubit.sendMessage(arguments);
                      // cubit.removeImage();
                      // cubit.messageController.clear();
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
