import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:meta/meta.dart';

part 'new_chat_event.dart';
part 'new_chat_state.dart';

class NewChatBloc extends Bloc<NewChatEvent, NewChatState> {
  FirebaseProvider firebaseProvider;
  NewChatBloc({required this.firebaseProvider}) : super(NewChatInitialState()) {
    on<GetAllUsersEvent>((event, emit) async {
      emit(NewChatLoadingState());
      try {
        var getUsers = await firebaseProvider.getAllUser();
        // var getUsers = await firebaseProvider.getAllUser().asStream().listen((event) {     emit(NewChatLoadedState(getUsers: event)); });

        emit(NewChatLoadedState(getUsers: getUsers));
      } catch (e) {
        emit(NewChatErrorState(errorMsg: e.toString()));
      }
    });
  }
}
