// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/features/screens/home_screen/home_screen.dart';
import 'package:mangochatapp/features/screens/home_screen/widgets/home_screen_navigation_bar.dart';
import 'package:mangochatapp/features/screens/profile_manege_screen/account_screen/account_screen.dart';
import 'package:mangochatapp/features/state_manegment/screen_provider.dart';
import 'package:mangochatapp/features/call/presentation/pages/call_history_screen.dart';
import 'package:mangochatapp/features/story/presentation/pages/story_screen.dart';
import 'package:provider/provider.dart';

class AppHome extends StatelessWidget {
  AppHome({super.key});
  var bottomBarScreens = [
    HomeScreens(),
    StoryScreen(),
    CallHistoryScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.white,
        // appBar: HomePageAppBAr(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: UIColors.primary,
          child: Icon(
            CupertinoIcons.add,
            color: UIColors.white,
          ),
        ),
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
