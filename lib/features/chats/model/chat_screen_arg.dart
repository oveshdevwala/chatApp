import 'package:mangochatapp/features/chats/model/user_model.dart';

class ChatScreenArguments {
  ChatScreenArguments({ required this.toId, required this.userModel});
  String toId;
  UserModel userModel;
}
