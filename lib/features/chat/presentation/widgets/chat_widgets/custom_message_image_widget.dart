import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/extensions/media_query.dart';
import '../../../../../core/widgets/custom_image_network.dart';
import '../../../data/models/message_model.dart';

class CustomMessageImageWidget extends StatelessWidget {
  final MessageModel message;

  const CustomMessageImageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColors.strokeColor),
      ),
      constraints: BoxConstraints(
        maxWidth: context.width * 0.7,
        minWidth: context.width * 0.7,
      ),
      child: CustomImageNetwork(
        image: message.image!,
        widthImage: context.width,
        heightImage: 161.h,
        radiusValue: 24.r,
      ),
    );
  }
}
