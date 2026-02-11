import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/framework/spaces.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_error.dart';
import '../../../../core/widgets/custom_image_network.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../data/arguments/chat_arguments.dart';
import '../cubit/chat_cubit.dart';
import '../widgets/chat_widgets/custom_add_message_field_widget.dart';
import '../widgets/chat_widgets/custom_messages_list_widget.dart';

class ChatView extends StatelessWidget {
  final ChatArguments chatArguments;

  const ChatView({super.key, required this.chatArguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Row(
          children: [
            CustomImageNetwork(
              image: chatArguments.courier.image,
              widthImage: 40.w,
              heightImage: 40.h,
              radiusValue: 20.r,
            ),
            widthSpace(10.w),
            Text(
              chatArguments.courier.name,
              style: AppTextStyles.textStyle10.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          var cubit = context.read<ChatCubit>();
          if (state is ChatLoading) {
            return const CustomLoading();
          } else if (state is ChatFailure) {
            return CustomError(
              error: state.message,
              retry: () {
                 cubit.fetchChat(chatArguments.chatId);
              },
            );
          } else {
            return Column(
              children: [
                CustomMessagesListWidget(cubit: cubit,receiverImage: chatArguments.courier.image,),
                CustomAddMessageFieldWidget(
                  cubit: cubit,
                  arguments: chatArguments,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
