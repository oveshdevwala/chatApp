// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'home_screen_chats_bloc.dart';

@immutable
sealed class HomeScreenChatsState {}

final class HomeScreenChatsInitial extends HomeScreenChatsState {}

class HomeScreenLoadingState extends HomeScreenChatsState {}

class HomeScreenLoadedState extends HomeScreenChatsState {
  List<UserModel> getUsers;
  HomeScreenLoadedState({
    required this.getUsers,
  });
}

class HomeScreenErrorState extends HomeScreenChatsState {
  String erroMsg;
  HomeScreenErrorState({
    required this.erroMsg,
  });
}
