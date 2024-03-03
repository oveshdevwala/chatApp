import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/features/app/global/entities/variables.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/routes/page_routes.dart';
import 'package:mangochatapp/features/state_manegment/chat_screen/bottom_sheet_provider.dart';
import 'package:mangochatapp/features/state_manegment/home_screen_chat_bloc/home_screen_chats_bloc.dart';
import 'package:mangochatapp/features/state_manegment/imagePickerBloc/image_picker_bloc.dart';
import 'package:mangochatapp/features/state_manegment/login_screen/country_code_bloc/contry_code_bloc.dart';
import 'package:mangochatapp/features/user/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:mangochatapp/features/state_manegment/new_chat_bloc/new_chat_bloc.dart';
import 'package:mangochatapp/features/state_manegment/new_contact_bloc/new_contact_bloc.dart';
import 'package:mangochatapp/features/state_manegment/phonenumber_provider.dart';
import 'package:mangochatapp/features/state_manegment/screen_provider.dart';
import 'package:mangochatapp/features/state_manegment/user_profile_data_provider.dart';
import 'package:mangochatapp/features/state_manegment/video_picker_bloc/video_picker_bloc.dart';
import 'package:mangochatapp/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
/// Domain And Data Layer Done In User Feature 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) {
        return ScreenProvider();
      }),
      ChangeNotifierProvider(create: (context) {
        return PhoneNumberProvider();
      }),
      ChangeNotifierProvider(create: (context) {
        return UserProfileDataProvider();
      }),
      ChangeNotifierProvider(create: (context) {
        return CurrentProfilePictureProvider();
      }),
      ChangeNotifierProvider(create: (context) {
        return BottomSheetProvider();
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
              ImagePickerBloc(firebaseProvider: FirebaseProvider())),
      BlocProvider(
          create: (context) =>
              VideoPickerBloc(firebaseProvider: FirebaseProvider())),
      BlocProvider(create: (context) => ContryCodeBloc()),
      BlocProvider(
          create: (context) =>
              NewChatBloc(firebaseProvider: FirebaseProvider())),
      BlocProvider(create: (context) => NewContactBloc()),
    ], child: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void didChangeAppLifecycleState(AppLifecycleState state) async {
    var prefs = await SharedPreferences.getInstance();
    var uId = prefs.getString(LoginPrefKey);
    if (uId != null) {
      if (uId.isNotEmpty) {
        super.didChangeAppLifecycleState(state);
        switch (state) {
          case AppLifecycleState.resumed:
            FirebaseProvider.UpdateUserOnline();
            FirebaseProvider.updatePushToken();
            break;
          case AppLifecycleState.inactive:
          case AppLifecycleState.paused:
          case AppLifecycleState.detached:
            FirebaseProvider.UpdateUserOffline();

          default:
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}





/**
var userStream = FirebaseProvider.getHomeScreenUsers();
class HomeScreenChatsBloc
    extends Bloc<HomeScreenChatsEvent, HomeScreenChatsState> {
  // FirebaseProvider firebaseProvider;

  HomeScreenChatsBloc() : super(HomeScreenChatsInitial()) {
    userStream.listen((user) {
      add(GetHomeChatsEvent(userModel: user));
    });
    on<GetHomeChatsEvent>((event, emit) {
      emit(HomeScreenLoadingState());
      try {
        emit(HomeScreenLoadedState(getUsers: event.userModel!));
      } catch (e) {
        emit(HomeScreenErrorState(erroMsg: e.toString()));
      }
    });
  }
} 
**/
