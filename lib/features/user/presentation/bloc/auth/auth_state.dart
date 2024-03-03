// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthenticatedState extends AuthState {
  final String uId;

  AuthenticatedState({required this.uId});

  @override
  List<Object?> get props => [uId];
}

class UnAuthenticatedState extends AuthState {
  String? errorMsg = '';
  UnAuthenticatedState({
     this.errorMsg,
  });
  @override
  List<Object?> get props => [];
}
