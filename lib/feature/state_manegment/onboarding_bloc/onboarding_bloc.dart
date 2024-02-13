import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:meta/meta.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  FirebaseProvider firebaseProvider;
  OnBoardingBloc({required this.firebaseProvider})
      : super(OnBoardingInitial()) {
    on<CreateUserEvent>((event, emit) async {
      emit(OnBoardingLoadingState());
      try {
        await firebaseProvider.createUser(
            mUserModel: event.userModel, pass: event.password);

        emit(OnBoardingLoadedState());
      } catch (e) {
        emit(OnBoardingErrorState(errorMsg: e.toString()));
      }
    });

    on<SignInEvent>(
      (event, emit) async {
        emit(OnBoardingLoadingState());
        try {
          await firebaseProvider.signInuser(
              email: event.email, password: event.password);
          emit(OnBoardingLoadedState());
        } catch (e) {
          emit(OnBoardingErrorState(errorMsg: e.toString()));
        }
      },
    );
    on<MobileVerifyPhoneNumberEvent>(
      (event, emit) async {
        emit(OnBoardingLoadingState());
        try {
          // await firebaseProvider.verifyPhoneNumber(
          //   phoneNumber: event.phoneNumber,
          //   codeSent: (verificationId, forceResendingToken) {
          //     // Navigator.push(
          //     //     event.context,
          //     //     MaterialPageRoute(
          //     //       builder: (context) => OTPScreeen(verifyId: verificationId),
          //     // ));
          //     emit(OnBoardingLoadedState(verifyId: verificationId));
          //   },
          //   error: (error) {
          //     emit(OnBoardingErrorState(errorMsg: error.toString()));
          //   },
          // );
          await firebaseProvider.verifyPhoneNumber(
              phoneNumber: event.phoneNumber, context: event.context);
          emit(OnBoardingLoadedState());
        } on FirebaseAuthException catch (error) {
          emit(OnBoardingErrorState(errorMsg: error.toString()));
        }
      },
    );
    on<MobileCheckCrediential>(
      (event, emit) async {
        emit(OnBoardingLoadingState());
        try {
          // var verify = await firebaseProvider.checkCrediential(
          //     verifyId: event.verifyId, otp: event.otp);
          // await FirebaseAuth.instance
          //     .signInWithCredential(verify)
          //     .then((value) async {
          //   var prefs = await SharedPreferences.getInstance();
          //   prefs.setString(LoginPrefKey, value.user!.uid);
          //   emit(OnBoardingLoadedState());
          // }).onError((error, stackTrace) {
          //   emit(OnBoardingErrorState(errorMsg: error.toString()));
          // });
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text('Succesfully')));

          // Navigator.pushNamed(context, AppRoutes.appHomeScreen);
          await firebaseProvider.checkCrediential(
              emailContoller: event.emailNumber,
              number: event.phoneNumber,
              userName: event.userNameProvider,
              verifyId: event.verifyId,
              otp: event.otp,
              context: event.context);
          emit(OnBoardingLoadedState());
        } on FirebaseAuthException catch (error) {
          emit(OnBoardingErrorState(errorMsg: error.toString()));
        }
      },
    );
  }
}
