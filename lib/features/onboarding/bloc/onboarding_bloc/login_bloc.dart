import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
part 'login_event.dart';
part 'login_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  FirebaseProvider firebaseProvider;
  OnBoardingBloc({required this.firebaseProvider})
      : super(OnBoardingLoadingState()) {
    on<MobileVerifyPhoneNumberEvent>(
      (event, emit) async {
        emit(OnBoardingLoadingState());
        try {
          await firebaseProvider.verifyPhoneNumber(
              phoneNumber: event.phoneNumber, context: event.context);
          emit(OnBoardingLoadedState(number: event.phoneNumber));
          
        } catch (error) {
          emit(OnBoardingverificationFailedState(
              errorMsg: error.toString()));
        }
      },
    );
    on<MobileCheckCrediential>(
      (event, emit) async {
        emit(OnBoardingLoadingState());
        try {
          await firebaseProvider.checkCrediential(
              number: event.phoneNumber,
              userName: event.userNameProvider,
              verifyId: event.verifyId,
              otp: event.otp,
              context: event.context);
          emit(OnBoardingLoadedState(number: event.phoneNumber));
        } on FirebaseAuthException catch (error) {
          emit(OnBoardingErrorState(errorMsg: error.toString()));
        }
      },
    );
  }
}
