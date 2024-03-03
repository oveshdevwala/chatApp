import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/splash/splash_screen.dart';
import 'package:mangochatapp/features/chat/presentation/pages/chat_screen.dart';
import 'package:mangochatapp/features/user/presentation/screen/login_screen.dart';
import '../features/screens/new_chat/new_chat.dart';
import '../features/screens/profile_manege_screen/account_screen/account_screen.dart';
import '../features/app/home/app_home.dart';
import '../features/app/landing/welcome_screen.dart';

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
