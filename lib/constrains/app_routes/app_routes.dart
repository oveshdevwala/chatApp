import 'package:flutter/material.dart';
import 'package:mangochatapp/feature/screens/home_screen/home_screen.dart';
import 'package:mangochatapp/feature/screens/new_chat/new_chat.dart';
import 'package:mangochatapp/feature/screens/onboarding/phone_login_screen/phone_number_login.dart';
import 'package:mangochatapp/feature/screens/onboarding/signin_screen/signin_screen.dart';
import 'package:mangochatapp/feature/screens/onboarding/signup_screen/signup_screen.dart';
import 'package:mangochatapp/feature/screens/onboarding/splash_screen/splash_screen.dart';
import 'package:mangochatapp/feature/screens/profile_screen/profile_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String signInScreen = '/sign_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String chatScreen = '/chat_screen';
  static const String otpScreen = '/otp_screen';
  static const String appHomeScreen = '/app_home_screen';
  static const String newChatScreen = '/new_chat_screen';
  static const String profileScreen = '/profile_screen';
  static const String phoneNumberScreen = '/phone_number_screen';
  static Map<String, WidgetBuilder> get routes => {
        splashScreen: (context) => SplashScreen(),
        signInScreen: (context) => SignInScreen(),
        phoneNumberScreen: (context) => PhoneNumberScreen(),
        signUpScreen: (context) => SignUpScreen(),
        // chatScreen:(context) => ChatScreen(),
        appHomeScreen: (context) => AppHome(),
        // otpScreen: (context) => OTPScreeen(),

        newChatScreen: (context) => NewChatScreen(),
        profileScreen: (context) => ProfileScreen()
      };
}
