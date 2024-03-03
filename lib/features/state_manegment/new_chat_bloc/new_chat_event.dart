part of 'new_chat_bloc.dart';

@immutable
sealed class NewChatEvent {}


class GetAllUsersEvent extends NewChatEvent{}