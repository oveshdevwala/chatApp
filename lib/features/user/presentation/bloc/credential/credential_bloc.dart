// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mangochatapp/features/user/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';
import 'package:mangochatapp/features/user/domain/usecases/credential/sign_in_with_phone_number_usecase.dart';
import 'package:mangochatapp/features/user/domain/usecases/credential/verify_phone_number_usecase.dart';
import 'package:mangochatapp/features/user/domain/usecases/user/create_user_usecase.dart';
part 'credential_event.dart';
part 'credential_state.dart';

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {
  final SignInWithPhoneNumberUseCase signInWithPhoneNumberUseCase;
  final VerifyPhoneNumberUseCase verifyPhoneNumberUseCase;
  final CreateUserUseCase createUserUseCase;

  CredentialBloc({
    required this.signInWithPhoneNumberUseCase,
    required this.verifyPhoneNumberUseCase,
    required this.createUserUseCase,
  }) : super(CredentialInitial()) {
    on<SubmitVerifyPhoneNumberEvent>(submitVerifyPhoneNumberEvent);
    on<SubmitSmsCodeEvent>(submitSmsCodeEvent);
    on<SubmitProfileInfoEvent>(submitProfileInfoEvent);
  }

  FutureOr<void> submitVerifyPhoneNumberEvent(
      SubmitVerifyPhoneNumberEvent event, Emitter<CredentialState> emit) async {
    try {
      await verifyPhoneNumberUseCase.call(event.phoneNumber);
      emit(CredentialPhoneAuthSmsCodeReceivedState(phoneNumber: event.phoneNumber));
    } on SocketException catch (e) {
      emit(CredentialFailureState(errorMsg: e.toString()));
    } catch (e) {
      emit(CredentialFailureState(errorMsg: e.toString()));
    }
  }

  FutureOr<void> submitSmsCodeEvent(
      SubmitSmsCodeEvent event, Emitter<CredentialState> emit) async {
    try {
      await signInWithPhoneNumberUseCase.call(event.smsCode);
      emit(CredentialPhoneAuthProfileInfoState());
    } on SocketException catch (e) {
      emit(CredentialFailureState(errorMsg: e.toString()));
    } catch (e) {
      emit(CredentialFailureState(errorMsg: e.toString()));
    }
  }

  FutureOr<void> submitProfileInfoEvent(
      SubmitProfileInfoEvent event, Emitter<CredentialState> emit) async {
    try {
      await createUserUseCase.call(event.user);
      emit(CredentialSuccessState());
    } on SocketException catch (e) {
      emit(CredentialFailureState(errorMsg: e.toString()));
    } catch (e) {
      emit(CredentialFailureState(errorMsg: e.toString()));
    }
  }
}
