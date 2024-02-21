import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:meta/meta.dart';

part 'new_contact_event.dart';
part 'new_contact_state.dart';

class NewContactBloc extends Bloc<NewContactEvent, NewContactState> {
  NewContactBloc() : super(NewContactInitial()) {
    on<GetAllContact>((event, emit) async {
      emit(NewContactLoadingState());
      try {
        List<Contact> finalContact = [];
        List<UserModel> finalUser = [];
        if (await FlutterContacts.requestPermission()) {
          List<Contact> contacts =
              await FlutterContacts.getContacts(withProperties: true);
          var user = await FirebaseProvider.fireStore
              .collection(FirebaseProvider.userCollection)
              .get();
          for (var userMo in user.docs) {
            var userModel = UserModel.fromDoc(userMo.data());
            for (var con in contacts) {
              if (con.phones.isNotEmpty) {
                if (userModel.mobileNumber == con.phones[0].normalizedNumber) {
                  if (userModel.id != FirebaseProvider.userId) {
                    finalContact.add(con);
                    finalUser.add(userModel);
                  }
                }
              }
            }
          }
          emit(NewContactLoadedState(contact: finalContact, user: finalUser));
        }
      } catch (e) {
        emit(NewContactErrorState(errorMsg: e.toString()));
        print(e.toString());
      }
    });
  }
}
