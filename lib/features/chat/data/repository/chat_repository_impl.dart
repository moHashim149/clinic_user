import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../data_source/remote/chat_remote_data_source.dart';
import '../models/message_model.dart';
import '../params/conversation_params.dart';
import '../params/send_message_param.dart';
import 'chat_repository.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl extends ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepositoryImpl({required this.chatRemoteDataSource});

  @override
  Future<Either<Failure, List<MessageModel>>> fetchConversation(ConversationParams params) async {
    try {
      List<MessageModel> messages = await chatRemoteDataSource.fetchConversation(params);
      return Right(messages);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }

  @override
  Future<Either<Failure, MessageModel>> sendMessage(SendMessageParam params) async {
    try {
      MessageModel messageModel = await chatRemoteDataSource.sendMessage(params);
      return Right(messageModel);
    } on ServerException catch (exception) {
      return Left(ApiFailure(exception.message!));
    }
  }



}
