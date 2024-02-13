import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/constrains/app_routes/app_routes.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/state_manegment/home_screen_chat_bloc/home_screen_chats_bloc.dart';
import 'package:mangochatapp/feature/state_manegment/new_chat_bloc/new_chat_bloc.dart';
import 'package:mangochatapp/feature/state_manegment/new_message_splash_provider.dart';
import 'package:mangochatapp/feature/state_manegment/phonenumber_provider.dart';
import 'package:mangochatapp/feature/state_manegment/screen_provider.dart';
import 'package:mangochatapp/feature/state_manegment/onboarding_bloc/onboarding_bloc.dart';
import 'package:mangochatapp/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) {
        return ScreenProvider();
      }),
      ChangeNotifierProvider(create: (context) {
        return PhoneNumberProvider();
      }),
      ChangeNotifierProvider(create: (context) {
        return NewMsgSplashProvidewr();
      }),
    ],
    child: MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) =>
              OnBoardingBloc(firebaseProvider: FirebaseProvider())),
      BlocProvider(
          create: (context) =>
              HomeScreenChatsBloc(firebaseProvider: FirebaseProvider())),
      BlocProvider(
          create: (context) =>
              NewChatBloc(firebaseProvider: FirebaseProvider())),
    ], child: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
