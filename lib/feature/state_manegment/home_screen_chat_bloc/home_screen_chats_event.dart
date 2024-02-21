// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'home_screen_chats_bloc.dart';

@immutable
sealed class HomeScreenChatsEvent {}

class GetHomeChatsEvent extends HomeScreenChatsEvent {}
