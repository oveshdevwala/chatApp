// ignore_for_file: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/datasource/remote/firebase_notification_services/push_notification_services.dart';
import 'package:mangochatapp/feature/screens/home_screen/widgets/home_screen_appbar.dart';
import 'package:mangochatapp/feature/screens/home_screen/widgets/home_screen_navigation_bar.dart';
import 'package:mangochatapp/feature/screens/home_screen/widgets/stream_state_widgets/error_state_chat_list.dart';
import 'package:mangochatapp/feature/state_manegment/screen_provider.dart';
import 'package:provider/provider.dart';
import '../profile_manege_screen/account_screen/account_screen.dart';
import 'widgets/chat_segment.dart';
import 'widgets/stream_state_widgets/chated_user_loaded_state.dart';

var bottomBarScreens = [HomeScreen(), SizedBox(), SizedBox(), ProfileScreen()];

class AppHome extends StatelessWidget {
  AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.white,
        appBar: HomePageAppBAr(context),
        bottomNavigationBar: HomeScreenNavigationBar(),
        body: SafeArea(
          child: Consumer<ScreenProvider>(
            builder: (context, provider, child) {
              return bottomBarScreens[provider.screenIndex];
            },
          ),
        ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    FireNotification.initNotifications();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            chatSegment(),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseProvider.getUserIds(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                } else if (snapshot.hasError) {
                  return ErrorStateChatList(error: snapshot.error.toString());
                } else if (snapshot.hasData) {
                  if (snapshot.data!.docs.isNotEmpty) {
                    return ChatedUserLoadedState(snapshot: snapshot);
                  }
                }
                return SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
