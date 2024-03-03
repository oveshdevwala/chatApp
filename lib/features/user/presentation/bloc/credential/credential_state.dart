// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'credential_bloc.dart';

@immutable
sealed class CredentialState extends Equatable {}

final class CredentialInitial extends CredentialState {
  @override
  List<Object?> get props => [];
}

class CredentialLoadingState extends CredentialState {
  @override
  List<Object?> get props => [];
}

class CredentialSuccessState extends CredentialState {
  @override
  List<Object?> get props => [];
}

class CredentialPhoneAuthSmsCodeReceivedState extends CredentialState {
  String phoneNumber;
  CredentialPhoneAuthSmsCodeReceivedState({
    required this.phoneNumber,
  });
  @override
  List<Object?> get props => [phoneNumber];
}

class CredentialPhoneAuthProfileInfoState extends CredentialState {
  @override
  List<Object?> get props => [];
}

class CredentialFailureState extends CredentialState {
  String? errorMsg = '';
  CredentialFailureState({
    this.errorMsg = '',
  });
  @override
  List<Object?> get props => [errorMsg];
}
