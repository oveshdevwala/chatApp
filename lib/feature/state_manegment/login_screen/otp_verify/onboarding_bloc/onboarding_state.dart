// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'onboarding_bloc.dart';

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
