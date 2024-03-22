// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'login_bloc.dart';

@immutable
sealed class OnBoardingState {}

final class OnBoardingInitial extends OnBoardingState {}

class OnBoardingLoadingState extends OnBoardingState {}

class OnBoardingLoadedState extends OnBoardingState {
  String number;
  OnBoardingLoadedState({
    required this.number,
  });
}

class OnBoardingErrorState extends OnBoardingState {
  String errorMsg;
  OnBoardingErrorState({
    required this.errorMsg,
  });
}

class OnBoardingVerifyOtpState extends OnBoardingState {
  String number;
  String verifyId;
  OnBoardingVerifyOtpState({
    required this.number,
    required this.verifyId,
  });
}

class OnBoardingverificationFailedState extends OnBoardingState {
  String errorMsg;
  OnBoardingverificationFailedState({
    required this.errorMsg,
  });
}
