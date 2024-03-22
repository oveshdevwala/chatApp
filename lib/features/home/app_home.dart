// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';
import 'package:mangochatapp/features/chats/screen/home_screen/home_screen.dart';
import 'package:mangochatapp/features/chats/screen/home_screen/widgets/home_screen_navigation_bar.dart';
import 'package:mangochatapp/features/account/screen/account_screen/account_screen.dart';
import 'package:mangochatapp/features/home/provider/screen_provider.dart';
import 'package:provider/provider.dart';

class AppHome extends StatelessWidget {
  AppHome({super.key});
  var bottomBarScreens = [
    HomeScreens(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: UIColors.white,
       
     
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
