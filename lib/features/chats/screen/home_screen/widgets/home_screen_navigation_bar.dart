// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';
import 'package:mangochatapp/features/home/provider/screen_provider.dart';
import 'package:provider/provider.dart';

class HomeScreenNavigationBar extends StatelessWidget {
  HomeScreenNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(builder: (context, provider, child) {
      return BottomNavigationBar(
          iconSize: 30,
          backgroundColor: UIColors.white,
          currentIndex: provider.screenIndex,
          onTap: (value) {
            provider.screenIndex = value;
          },
          elevation: 60,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900),
          selectedItemColor: UIColors.primary,
          unselectedItemColor: UIColors.black26,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  CupertinoIcons.chat_bubble_2_fill,
                  color: UIColors.primary,
                ),
                icon: Icon(
                  CupertinoIcons.chat_bubble_2_fill,
                  color: UIColors.black26,
                ),
                label: 'Chats'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  CupertinoIcons.person_fill,
                  color: UIColors.primary,
                ),
                icon: Icon(
                  CupertinoIcons.person_fill,
                  color: UIColors.black26,
                ),
                label: 'Account')
          ]);
    });
  }
}

/** BottomNavigationBarItem(
                label: 'newChat',
                icon: ElevatedButton(
                    onPressed: () {
                      customdialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        foregroundColor: Colors.white,
                        backgroundColor: UIColors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.add), Text('New Chat')],
                    ))), */