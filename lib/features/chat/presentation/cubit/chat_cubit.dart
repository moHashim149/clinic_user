import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_cached.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers/image_helper.dart';
import '../../../../core/local/shared_preferences/shared_pref_services.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../data/arguments/chat_arguments.dart';
import '../../data/models/message_model.dart';
import '../../data/params/conversation_params.dart';
import '../../data/params/send_message_param.dart';
import '../../data/repository/chat_repository.dart';

part 'chat_state.dart';

@Injectable()
class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatsRepository;
  final DocumentHelper documentHelper;
  final SharedPrefServices sharedPrefServices;
  ChatCubit(this.chatsRepository, this.documentHelper, this.sharedPrefServices)
    : super(ChatInitial());

  List<MessageModel> messages = [];

  TextEditingController messageController = TextEditingController();
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

  Future<void> fetchChat(int chatId) async {
    emit(ChatLoading());
    final result = await chatsRepository.fetchConversation(
      ConversationParams(chatId: chatId),
    );
    result.fold((failure) => emit(ChatFailure(message: failure.message)), (
      messages,
    ) {
      this.messages = messages;
      emit(ChatLoaded());
      initPusher(chatId);
    });
  }

  Future<void> sendMessage(ChatArguments arguments) async {
    if (messageController.text.isEmpty && image == null) {
      return;
    }
    emit(SendMessageLoading());
    final result = await chatsRepository.sendMessage(
      SendMessageParam(
        chatId: arguments.chatId,
        message: messageController.text.isNotEmpty
            ? messageController.text
            : null,
        file: image != null
            ? MultipartFile.fromFileSync(
                image!.path,
                filename: image!.path.split('/').last,
              )
            : null,
      ),
    );
    result.fold(
      (failure) {
        showToast(text: failure.message, state: ToastStates.error);
        emit(SendMessageFailure());
      },
      (messageModel) {
        messages.insert(0, messageModel);
        Future.delayed(Duration(milliseconds: 50), () {
          if (scrollController.hasClients) {
            scrollController.animateTo(
              scrollController.position.minScrollExtent,
              duration: Duration(milliseconds: 50),
              curve: Curves.easeOut,
            );
          }
        });
        emit(SendMessageLoaded());
      },
    );
  }

  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  Future<void> initPusher(int chatId) async {
    try {
      await pusher.init(
        apiKey: AppConstants.pusherKey,
        cluster: AppConstants.pusherCluster,
        authEndpoint: "${ApiConstants.baseUrl}${ApiConstants.pusherAuth}",
        onAuthorizer: onAuthorizer,
        onEvent: (event) {
          if (event.data.isNotEmpty) {
            var data = jsonDecode(event.data);
            if (event.eventName == "message.sent") {
              MessageModel messageModel = MessageModel.fromJson(data);
              messages.insert(0, messageModel);
              emit(ChatLoaded());
              Future.delayed(Duration(milliseconds: 50), () {
                if (scrollController.hasClients) {
                  scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: Duration(milliseconds: 50),
                    curve: Curves.easeOut,
                  );
                }
              });
            }
          }
        },
      );
      await pusher.subscribe(channelName: 'private-chat.$chatId');
      await pusher.connect();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  dynamic onAuthorizer(
    String channelName,
    String socketId,
    dynamic options,
  ) async {
    Map json;
    try {
      var authUrl = "${ApiConstants.baseUrl}${ApiConstants.pusherAuth}";
      var token = sharedPrefServices.getData(key: AppCached.token);
      var result = await Dio().post(
        authUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
        data: FormData.fromMap({
          'socket_id': socketId,
          'channel_name': channelName,
        }),
      );
      try {
        json = result.data;
      } catch (e) {
        return {};
      }

      return {"auth": json['auth']};
    } catch (e) {
      log("Error :$e");
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    messageController.dispose();
    scrollController.dispose();
    if (pusher.connectionState == "CONNECTED") {
      pusher.disconnect();
    }
    return super.close();
  }
}
