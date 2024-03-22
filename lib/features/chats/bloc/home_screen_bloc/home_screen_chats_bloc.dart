import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/features/chats/model/message_model.dart';
import 'package:mangochatapp/features/chats/model/user_model.dart';

part 'home_screen_chats_event.dart';
part 'home_screen_chats_state.dart';

class HomeScreenChatsBloc
    extends Bloc<HomeScreenChatsEvent, HomeScreenChatsState> {
  FirebaseProvider firebaseProvider;
  HomeScreenChatsBloc({required this.firebaseProvider})
      : super(HomeScreenChatsInitial()) {
    on<GetHomeChatsEvent>((event, emit) async {
      emit(HomeScreenLoadingState());
      List<UserModel> finalUserList = [];
      List<String> userId = ['kfk'];
      try {
        // var chatsUser = await FirebaseProvider.getAllMesageTest();
        var chatsUser = await FirebaseProvider.fireStore
            .collection(FirebaseProvider.chatCollation)
            .get();
        for (var chats in await chatsUser.docs) {
          var chatedUsers = await MessageModel.fromDoc(chats.data());
          print(chatedUsers.messageId);
          if (chatedUsers.toId == await FirebaseProvider.userId &&
              chatedUsers.fromId == await FirebaseProvider.userId) {
            userId.add(chatedUsers.toId);
            print('Chated User Id : ${chatedUsers.toId}');
          } else {
            print('Failed To fetch Chated Chats');
            userId.add(chatedUsers.toId);
          }
          print('Failed To fetch Chated Chats');
        }
        debugPrint('List Of Chated User Id : ${userId}');
        emit(HomeScreenLoadedState(getUsers: finalUserList));
      } catch (e) {
        print('This is Exception Error $e');
        emit(HomeScreenErrorState(erroMsg: e.toString()));
      }
    });
  }
}
