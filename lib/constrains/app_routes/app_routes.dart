import 'package:flutter/material.dart';
import 'package:mangochatapp/feature/screens/home_screen/home_screen.dart';
import 'package:mangochatapp/feature/screens/new_chat/new_chat.dart';
import 'package:mangochatapp/feature/screens/onboarding/landing_screen.dart/landing_screen.dart';
import 'package:mangochatapp/feature/screens/onboarding/login_screen.dart/login_screen.dart';
import 'package:mangochatapp/feature/screens/onboarding/splash_screen/splash_screen.dart';
import 'package:mangochatapp/feature/screens/profile_manege_screen/account_screen/account_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String loginScreen = '/login_screen';
  // static const String chatScreen = '/chat_screen';
  static const String otpScreen = '/otp_screen';
  static const String appHomeScreen = '/app_home_screen';
  static const String newChatScreen = '/new_chat_screen';
  static const String profileScreen = '/profile_screen';
  static const String landingScreen = '/landing_screen';
  static const String phoneNumberScreen = '/phone_number_screen';
  static Map<String, WidgetBuilder> get routes => {
        splashScreen: (context) => SplashScreen(),
        // chatScreen:(context) => ChatScreen(),
        appHomeScreen: (context) => AppHome(),
        loginScreen: (context) => LoginScreen(),
        // otpScreen: (context) => OTPScreeen(),

        newChatScreen: (context) => NewChatScreen(),
        profileScreen: (context) => ProfileScreen(),
        landingScreen: (context) => LandingScreen()
      };
}
