// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'contry_code_bloc.dart';

@immutable
sealed class ContryCodeEvent {}

class ContryCodeGetEvent extends ContryCodeEvent {
  Country? contryCode;
  ContryCodeGetEvent({
    required this.contryCode,
  });
}
