// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'onboarding_bloc.dart';

@immutable
sealed class OnBoardingEvent {}

class CreateUserEvent extends OnBoardingEvent {
  String password;
  UserModel userModel;
  CreateUserEvent({
    required this.password,
    required this.userModel,
  });
}

class SignInEvent extends OnBoardingEvent {
  String email;
  String password;
  SignInEvent({
    required this.email,
    required this.password,
  });
}

class MobileVerifyPhoneNumberEvent extends OnBoardingEvent {
  String phoneNumber;
  BuildContext context;
  MobileVerifyPhoneNumberEvent({
    required this.phoneNumber,
    required this.context,
  });
}

class MobileCheckCrediential extends OnBoardingEvent {
  String otp;
  String verifyId;
  BuildContext context;
    String phoneNumber;
    String emailNumber;
  String userNameProvider;
  MobileCheckCrediential({
    required this.otp,
    required this.phoneNumber,
    required this.emailNumber,
    required this.userNameProvider,
    required this.verifyId,
    required this.context,
  });
}
