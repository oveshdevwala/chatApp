import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/features/chats/model/user_model.dart';
import 'package:meta/meta.dart';

part 'new_contact_event.dart';
part 'new_contact_state.dart';

class NewContactBloc extends Bloc<NewContactEvent, NewContactState> {
  NewContactBloc() : super(NewContactInitial()) {
    on<GetAllContact>((event, emit) async {
      emit(NewContactLoadingState());
      print('loading Called!!!');
      try {
        List<UserModel> finalUser = [];
        // print('permission Try Called!!!');
        if (await FlutterContacts.requestPermission()) {
          // print('permission Called!!!');
          List<Contact> contacts = await FlutterContacts.getContacts(
              withProperties: true, withPhoto: true);
          var user = await FirebaseProvider.fireStore
              .collection(FirebaseProvider.userCollection)
              .get();
          for (var userMo in user.docs) {
            // print('user mo Called!!!');
            var userModel = UserModel.fromDoc(userMo.data());
            // print('user model Called!!!');
            for (var con in contacts) {
              // print('con  Called!!!');
              if (con.phones.isNotEmpty) {
                // print('con condition Called!!!');
                if (userModel.mobileNumber == con.phones[0].normalizedNumber) {
                  // print('con condition Called!!!');
                  if (userModel.id != FirebaseProvider.userId) {
                    // print('userModel Called!!!');
                    finalUser.add(userModel);
                  }
                }
              }
            }
          }
          print('loaded state Called!!!');
          emit(NewContactLoadedState( user: finalUser));
        }
      } catch (e) {
        emit(NewContactErrorState(errorMsg: e.toString()));
        print(e.toString());
      }
    });
  }
}
