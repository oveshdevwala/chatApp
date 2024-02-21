// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'contry_code_bloc.dart';

@immutable
sealed class ContryCodeState {}

final class ContryCodeInitial extends ContryCodeState {}

class ContryCodeLoadedState extends ContryCodeState {
  Country? code;
  ContryCodeLoadedState({
    required this.code,
  });
}

class ContryCodeLoadingState extends ContryCodeState {}

class ContryCodeErrorState extends ContryCodeState {}
