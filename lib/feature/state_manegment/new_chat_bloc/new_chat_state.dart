// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'new_chat_bloc.dart';

@immutable
sealed class NewChatState {}

final class NewChatInitialState extends NewChatState {}

class NewChatLoadingState extends NewChatState {}

class NewChatLoadedState extends NewChatState {
  QuerySnapshot<Map<String, dynamic>> getUsers;

  
  NewChatLoadedState({
    required this.getUsers,
  });
}

class NewChatErrorState extends NewChatState {
  String errorMsg;
  NewChatErrorState({
    required this.errorMsg,
  });
}
