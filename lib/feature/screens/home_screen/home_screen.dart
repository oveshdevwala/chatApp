// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/state_manegment/home_screen_chat_bloc/home_screen_chats_bloc.dart';
import 'package:mangochatapp/feature/state_manegment/new_chat_bloc/new_chat_bloc.dart';
import 'package:mangochatapp/feature/state_manegment/screen_provider.dart';
import 'package:mangochatapp/feature/screens/home_screen/widgets/home_screen_appbar.dart';
import 'package:mangochatapp/feature/screens/home_screen/widgets/home_screen_navigation_bar.dart';
import 'package:mangochatapp/feature/screens/home_screen/widgets/my_status_row.dart';
import 'package:mangochatapp/feature/screens/profile_screen/profile_screen.dart';
import 'package:provider/provider.dart';
import 'widgets/my_chat_list.dart';

class AppHome extends StatefulWidget {
  AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  var bottomBarScreens = [HomeScreen(), SizedBox(), ProfileScreen()];
  int screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    context.read<NewChatBloc>().add(GetAllUsersEvent());
    // print(MessageType.document.toString());
    return Scaffold(
        backgroundColor: UIColors.white,
        appBar: HomePageAppBAr(),
        bottomNavigationBar: HomeScreenNavigationBar(screenIndex: screenIndex),
        body: Consumer<ScreenProvider>(
          builder: (context, provider, child) {
            return bottomBarScreens[provider.screenIndex];
          },
        ));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseProvider.UpdateUserOnline();
  }

  @override
  void dispose() {
    super.dispose();
    FirebaseProvider.UpdateUserOffline();
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeScreenChatsBloc>().add(GetHomeChatsEvent());
    return SingleChildScrollView(
      child: Column(
        children: [
          MyStatusRow(),
          MyChatList(),
        ],
      ),
    );
  }
}
