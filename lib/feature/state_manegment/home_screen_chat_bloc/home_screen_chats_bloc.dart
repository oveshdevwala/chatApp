import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:meta/meta.dart';

part 'home_screen_chats_event.dart';
part 'home_screen_chats_state.dart';

class HomeScreenChatsBloc
    extends Bloc<HomeScreenChatsEvent, HomeScreenChatsState> {
  FirebaseProvider firebaseProvider;
  HomeScreenChatsBloc({required this.firebaseProvider})
      : super(HomeScreenChatsInitial()) {
    on<GetHomeChatsEvent>((event, emit) async {
      emit(HomeScreenLoadingState());
      try {
        // await  firebaseProvider.getHomeScreenUsers().asStream().listen((user)  {
        //     emit(HomeScreenLoadedState(getUsers:  user));
        //   });

        var user =await  firebaseProvider.getHomeScreenUsers();
        emit(HomeScreenLoadedState(getUsers: user));
      } catch (e) {
        emit(HomeScreenErrorState(erroMsg: e.toString()));
      }
    });
  }
}
