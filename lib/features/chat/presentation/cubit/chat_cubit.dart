import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_cached.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers/image_helper.dart';
import '../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../data/models/message_model.dart';
import '../../data/params/send_message_param.dart';
import '../../data/repository/chat_repository.dart';

part 'chat_state.dart';

@Injectable()
class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatsRepository;
  final DocumentHelper documentHelper;
  final SharedPrefServices sharedPrefServices;
  ChatCubit(
    this.chatsRepository,
    this.documentHelper,
    this.sharedPrefServices,
  ) : super(ChatInitial());

  List<MessageModel> messages = [];

  TextEditingController messageController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  ScrollController scrollController = ScrollController();
  final formKey = GlobalKey<FormState>();

  File? image;

  void selectImage() async {
    var pickedImage = await documentHelper.pickImage(
      type: PickImageFromEnum.gallery,
    );
    if (pickedImage != null) {
      image = pickedImage;
      messageController.clear();
    }
    emit(ChatLoaded());
  }

  void removeImage() {
    image = null;
    emit(ChatLoaded());
  }

  // Future<void> fetchChat(int receiverId) async {
  //   emit(ChatLoading());
  //   final result = await chatsRepository.fetchChat(
  //     ChatParams(id: receiverId),
  //   );
  //   result.fold(
  //     (failure) => emit(ChatFailure(message: failure.message)),
  //     (messages) {
  //       this.messages = messages;
  //       emit(ChatLoaded());
  //     },
  //   );
  // }
  //
  // Future<void> sendMessage(ChatArguments arguments) async {
  //   if (messageController.text.isEmpty && image == null) {
  //     return;
  //   }
  //   emit(SendMessageLoading());
  //   final result = await chatsRepository.sendMessage(
  //     SendMessageParam(
  //       receiverId: arguments.user.id,
  //       message: messageController.text.isNotEmpty
  //           ? messageController.text
  //           : null,
  //       image: image != null
  //           ? MultipartFile.fromFileSync(
  //               image!.path,
  //               filename: image!.path.split('/').last,
  //             )
  //           : null,
  //       productid: arguments.productId,
  //     ),
  //   );
  //   result.fold(
  //     (failure) {
  //       showToast(text: failure.message, state: ToastStates.error);
  //       emit(SendMessageFailure());
  //     },
  //     (messageModel) {
  //       messages.insert(0, messageModel);
  //       Future.delayed(Duration(milliseconds: 50), () {
  //         if (scrollController.hasClients) {
  //           scrollController.animateTo(
  //             scrollController.position.minScrollExtent,
  //             duration: Duration(milliseconds: 50),
  //             curve: Curves.easeOut,
  //           );
  //         }
  //       });
  //       emit(SendMessageLoaded());
  //     },
  //   );
  // }

  // PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  //
  // Future<void> initPusher() async {
  //   try {
  //     String? userId = await sharedPrefServices.getData(key: AppCached.userId);
  //     await pusher.init(
  //       apiKey: AppConstants.pusherKey,
  //       cluster: AppConstants.pusherCluster,
  //       onEvent: (event) {
  //         if (event.data.isNotEmpty) {
  //           var data = jsonDecode(event.data);
  //           if (event.eventName == "NewMessageSent") {
  //             MessageModel messageModel = MessageModel.fromJson(data);
  //             messages.insert(0, messageModel);
  //             emit(ChatLoaded());
  //             Future.delayed(Duration(milliseconds: 50), () {
  //               if (scrollController.hasClients) {
  //                 scrollController.animateTo(
  //                   scrollController.position.minScrollExtent,
  //                   duration: Duration(milliseconds: 50),
  //                   curve: Curves.easeOut,
  //                 );
  //               }
  //             });
  //           }
  //         }
  //       },
  //     );
  //     await pusher.subscribe(channelName: 'chat.$userId');
  //     await pusher.connect();
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  @override
  Future<void> close() {
    // TODO: implement close
    messageController.dispose();
    otherController.dispose();
    scrollController.dispose();
    // if (pusher.connectionState == "CONNECTED") {
    //   pusher.disconnect();
    // }
    return super.close();
  }
}
