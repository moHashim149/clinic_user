
import '../../models/message_model.dart';
import '../../params/conversation_params.dart';
import '../../params/send_message_param.dart';

abstract class ChatRemoteDataSource {
  Future<List<MessageModel>> fetchConversation(ConversationParams params);
  Future<MessageModel> sendMessage(SendMessageParam params);
}
