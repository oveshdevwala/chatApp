// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:mangochatapp/features/user/domain/usecases/credential/get_current_user_usecase.dart';
import 'package:mangochatapp/features/user/domain/usecases/credential/is_sign_in_usecase.dart';
import 'package:mangochatapp/features/user/domain/usecases/credential/sign_out_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  GetCurrentUserUseCase getCurrentUserUseCase;
  IsSignInUsecase isSignInUsecase;
  SignOutUseCase signOutUseCase;
  AuthBloc({
    required this.getCurrentUserUseCase,
    required this.isSignInUsecase,
    required this.signOutUseCase,
  }) : super(AuthInitial()) {
    on<AppStartEvent>(appStartEvent);
    on<LoggedInEvent>(loggedInEvent);
    on<LoggedOutEvent>(loggedOutEvent);
  }

  FutureOr<void> appStartEvent(
      AppStartEvent event, Emitter<AuthState> emit) async {
    try {
      bool isSingIn = await isSignInUsecase.call();
      if (isSingIn) {
        final uId = await getCurrentUserUseCase.call();
        emit(AuthenticatedState(uId: uId));
      } else {
        emit(UnAuthenticatedState());
      }
    } catch (e) {
      emit(UnAuthenticatedState(errorMsg: e.toString()));
    }
  }

  FutureOr<void> loggedInEvent(
      LoggedInEvent event, Emitter<AuthState> emit) async {
    try {
      final uId = await getCurrentUserUseCase.call();
      emit(AuthenticatedState(uId: uId));
    } catch (e) {
      emit(UnAuthenticatedState(errorMsg: e.toString()));
    }
  }

  FutureOr<void> loggedOutEvent(
      LoggedOutEvent event, Emitter<AuthState> emit) async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticatedState());
    } catch (e) {

      emit(UnAuthenticatedState());
    }
  }
}
