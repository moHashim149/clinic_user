import 'package:injectable/injectable.dart';
import '../../../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/base_response.dart';
import '../../../../../core/constants/api_constants.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../models/message_model.dart';
import '../../params/conversation_params.dart';
import '../../params/send_message_param.dart';
import 'chat_remote_data_source.dart';

@Injectable(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl extends ChatRemoteDataSource {
  final ApiConsumer apiConsumer;

  ChatRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<MessageModel>> fetchConversation(ConversationParams params) async {
    BaseResponse response = await apiConsumer.get(
      ApiConstants.conversations(params.chatId),
    );
    if (response.status == true) {
      return (response.data as List).map((e) => MessageModel.fromJson(e)).toList();
    } else {
      throw ServerException(response.message.toString());
    }
  }

  @override
  Future<MessageModel> sendMessage(SendMessageParam params) async {
    BaseResponse response = await apiConsumer.post(
      ApiConstants.sendMessage,
      formDataIsEnabled: true,
      body: params.toJson(),
    );
    if (response.status == true) {
      return MessageModel.fromJson(response.data);
    } else {
      throw ServerException(response.message.toString());
    }
  }

}
