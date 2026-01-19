
import '../../../auth/data/models/user_model.dart';

class ChatArguments {
  final int productId;
  final UserModel user;

  ChatArguments({required this.productId,required this.user});
}