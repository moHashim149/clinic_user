
import '../../../auth/data/models/user_model.dart';

class ChatArguments {
  final int chatId;
  final UserModel courier;

  ChatArguments({required this.chatId,required this.courier});
}