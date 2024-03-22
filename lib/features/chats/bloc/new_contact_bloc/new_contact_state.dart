// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'new_contact_bloc.dart';

@immutable
sealed class NewContactState {}

final class NewContactInitial extends NewContactState {}

class NewContactLoadingState extends NewContactState {}

class NewContactLoadedState extends NewContactState {
  List<UserModel>? user;
  NewContactLoadedState({
    
   required this.user,
  });
}

class NewContactErrorState extends NewContactState {
  String errorMsg;
  NewContactErrorState({
    required this.errorMsg,
  });
}
