// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'credential_bloc.dart';

@immutable
sealed class CredentialEvent extends Equatable {}

class SubmitVerifyPhoneNumberEvent extends CredentialEvent {
  String phoneNumber;
  SubmitVerifyPhoneNumberEvent({
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [phoneNumber];
}

class SubmitSmsCodeEvent extends CredentialEvent {
  String smsCode;
  SubmitSmsCodeEvent({
    required this.smsCode,
  });

  @override
  List<Object?> get props => [smsCode];
}

class SubmitProfileInfoEvent extends CredentialEvent {
  UserEntity user;
  SubmitProfileInfoEvent({
    required this.user,
  });
  
  @override
  List<Object?> get props => [user];
}
