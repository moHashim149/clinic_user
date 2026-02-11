import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../models/message_model.dart';
import '../params/conversation_params.dart';
import '../params/send_message_param.dart';

abstract class ChatRepository {

  Future<Either<Failure, List<MessageModel>>> fetchConversation(ConversationParams params);
  Future<Either<Failure, MessageModel>> sendMessage(SendMessageParam params);



}
