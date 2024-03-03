part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}


class AppStartEvent extends AuthEvent{}
class LoggedInEvent extends AuthEvent{}
class LoggedOutEvent extends AuthEvent{}