import 'package:injectable/injectable.dart';
import '../data_source/remote/chat_remote_data_source.dart';
import 'chat_repository.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl extends ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;

  ChatRepositoryImpl({required this.chatRemoteDataSource});

  // @override
  // Future<Either<Failure, RoomsModel>> fetchRooms() async {
  //   try {
  //     RoomsModel roomsModel = await chatsRemoteDataSource.fetchRooms();
  //     return Right(roomsModel);
  //   } on ServerException catch (exception) {
  //     return Left(ApiFailure(exception.message!));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, List<MessageModel>>> fetchConversation(ConversationParams params) async {
  //   try {
  //     List<MessageModel> messages = await chatsRemoteDataSource.fetchConversation(params);
  //     return Right(messages);
  //   } on ServerException catch (exception) {
  //     return Left(ApiFailure(exception.message!));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, MessageModel>> sendMessage(SendMessageParam params) async {
  //   try {
  //     MessageModel messageModel = await chatsRemoteDataSource.sendMessage(params);
  //     return Right(messageModel);
  //   } on ServerException catch (exception) {
  //     return Left(ApiFailure(exception.message!));
  //   }
  // }
  //
  //

}
