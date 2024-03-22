// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'login_bloc.dart';

@immutable
sealed class OnBoardingEvent {}


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
  String userNameProvider;
  MobileCheckCrediential({
    required this.otp,
    required this.phoneNumber,
    required this.userNameProvider,
    required this.verifyId,
    required this.context,
  });
}
