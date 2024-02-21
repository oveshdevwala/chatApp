import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  FirebaseProvider firebaseProvider;
  OnBoardingBloc({required this.firebaseProvider})
      : super(OnBoardingInitial()) {
    on<MobileVerifyPhoneNumberEvent>(
      (event, emit) async {
        emit(OnBoardingLoadingState());
        try {
          await firebaseProvider.verifyPhoneNumber(
              phoneNumber: event.phoneNumber, context: event.context);
          emit(OnBoardingLoadedState(number: event.phoneNumber));
        } on FirebaseAuthException catch (error) {
          emit(OnBoardingErrorState(errorMsg: error.toString()));
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
