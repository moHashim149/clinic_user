import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/util/extensions/directionality.dart';
import '../../../../../core/widgets/custom_image_network.dart';
import '../../../data/models/message_model.dart';
import 'custom_message_image_widget.dart';
import 'custom_message_text_widget.dart';

class CustomMessageItemWidget extends StatelessWidget {
  final MessageModel messageModel;
  final String receiverImage;
  const CustomMessageItemWidget({super.key, required this.messageModel, required this.receiverImage});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: messageModel.viewType != "sender"
          ? context.isArabic
                ? TextDirection.ltr
                : TextDirection.rtl
          : context.isArabic
          ? TextDirection.rtl
          : TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [
        if(messageModel.viewType != "sender")
        CustomImageNetwork(
          image: receiverImage,
          radiusValue: 16.r,
          heightImage: 32.h,
          widthImage: 32.w,
        ),
        widthSpace(8.w),
        messageModel.message != null
            ? CustomMessageTextWidget(message: messageModel)
            : CustomMessageImageWidget(message: messageModel),
      ],
    );
  }
}
