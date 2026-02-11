import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_empty_data_widget.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../cubit/chat_cubit.dart';
import 'custom_mesage_item_widget.dart';

class CustomMessagesListWidget extends StatelessWidget {
  final ChatCubit cubit;
  final String receiverImage;
  const CustomMessagesListWidget({super.key, required this.cubit, required this.receiverImage});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        reverse: true,
        controller: cubit.scrollController,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
        itemBuilder: (context, index) {
          return CustomMessageItemWidget(messageModel: cubit.messages[index],receiverImage: receiverImage,);
        },
        separatorBuilder: (context, index) {
          return heightSpace(30.h);
        },
        itemCount: cubit.messages.length,
      ),
    );
  }
}
