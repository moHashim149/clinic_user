import 'package:injectable/injectable.dart';
import '../../../../../../../core/api/api_consumer.dart';
import 'chat_remote_data_source.dart';

@Injectable(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl extends ChatRemoteDataSource {
  final ApiConsumer apiConsumer;

  ChatRemoteDataSourceImpl({required this.apiConsumer});
  //
  // @override
  // Future<RoomsModel> fetchRooms() async {
  //   BaseResponse response = await apiConsumer.get(
  //     ApiConstants.rooms,
  //   );
  //   if (response.status == true) {
  //     return RoomsModel.fromJson(response.data);
  //   } else {
  //     throw ServerException(response.message.toString());
  //   }
  // }
  //
  // @override
  // Future<List<MessageModel>> fetchConversation(ConversationParams params) async {
  //   BaseResponse response = await apiConsumer.get(
  //     ApiConstants.conversation(params.id),
  //   );
  //   if (response.status == true) {
  //     return (response.data as List).map((e) => MessageModel.fromJson(e)).toList();
  //   } else {
  //     throw ServerException(response.message.toString());
  //   }
  // }
  //
  // @override
  // Future<MessageModel> sendMessage(SendMessageParam params) async {
  //   BaseResponse response = await apiConsumer.post(
  //     ApiConstants.sendMessage,
  //     formDataIsEnabled: true,
  //     body: params.toJson(),
  //   );
  //   if (response.status == true) {
  //     return MessageModel.fromJson(response.data);
  //   } else {
  //     throw ServerException(response.message.toString());
  //   }
  // }

}
