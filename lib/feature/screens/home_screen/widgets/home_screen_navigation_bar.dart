// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/state_manegment/screen_provider.dart';
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
          showUnselectedLabels: false,
          showSelectedLabels: true,
          selectedLabelStyle:
              TextStyle(color: UIColors.primary, fontWeight: FontWeight.bold),
          selectedItemColor: UIColors.primary,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  CupertinoIcons.chat_bubble_2_fill,
                  color: UIColors.primary,
                ),
                icon: Icon(
                  CupertinoIcons.chat_bubble_2,
                  color: UIColors.grey,
                ),
                label: 'Chats'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  CupertinoIcons.play_circle_fill,
                  color: UIColors.primary,
                ),
                icon: Icon(
                  CupertinoIcons.play_circle,
                  color: UIColors.grey,
                ),
                label: 'Story'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  CupertinoIcons.phone_fill,
                  color: UIColors.primary,
                ),
                icon: Icon(
                  CupertinoIcons.phone,
                  color: UIColors.grey,
                ),
                label: 'Calls'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  CupertinoIcons.person_fill,
                  color: UIColors.primary,
                ),
                icon: Icon(
                  CupertinoIcons.person,
                  color: UIColors.grey,
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