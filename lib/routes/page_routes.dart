import 'package:flutter/material.dart';
import 'package:mangochatapp/features/chats/screen/chat_screen/chat_screen.dart';
import 'package:mangochatapp/features/onboarding/screen/login_screen.dart';
import 'package:mangochatapp/features/onboarding/screen/splash_screen.dart';
import 'package:mangochatapp/features/onboarding/screen/welcome_screen.dart';
import '../features/chats/screen/new_chat/new_chat.dart';
import '../features/account/screen/account_screen/account_screen.dart';
import '../features/home/app_home.dart';
//
class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String loginScreen = '/login_screen';
  static const String otpScreen = '/otp_screen';
  static const String appHomeScreen = '/app_home_screen';
  static const String newChatScreen = '/new_chat_screen';
  static const String chatScreen = '/chat_screen';
  static const String profileScreen = '/profile_screen';
  static const String welcomeScreen = '/welcome_screen';
  static const String phoneNumberScreen = '/phone_number_screen';
  static Map<String, WidgetBuilder> get routes => {
        splashScreen: (context) => SplashScreen(),
        loginScreen: (context) => LoginScreen(),
        chatScreen: (context) => ChatScreen(),
        //otpScreen: (context) => otpScreen(),
        appHomeScreen: (context) => AppHome(),
        newChatScreen: (context) => NewChatScreen(),
        profileScreen: (context) => ProfileScreen(),
        welcomeScreen: (context) => WelcomeScreen()
        // phoneNumberScreen: (context) => phoneNumberScreen()
      };
}
