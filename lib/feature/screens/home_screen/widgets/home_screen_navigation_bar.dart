// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/state_manegment/screen_provider.dart';
import 'package:mangochatapp/feature/screens/home_screen/widgets/new_chat_dialog_box.dart';
import 'package:provider/provider.dart';

class HomeScreenNavigationBar extends StatefulWidget {
  HomeScreenNavigationBar({super.key, required this.screenIndex});
  int screenIndex;
  @override
  State<HomeScreenNavigationBar> createState() =>
      _HomeScreenNavigationBarState();
}

class _HomeScreenNavigationBarState extends State<HomeScreenNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenProvider>(builder: (context, provider, child) {
      return BottomNavigationBar(
          backgroundColor: UIColors.greyShade200,
          currentIndex: provider.screenIndex,
          onTap: (value) {
            provider.screenIndex = value;
            widget.screenIndex = value;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          // showSelectedLabels: false,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  CupertinoIcons.home,
                  color: Colors.black,
                ),
                icon: Icon(
                  CupertinoIcons.home,
                  color: Colors.grey,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
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
                        backgroundColor: Colors.black),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.add), Text('New Chat')],
                    ))),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  CupertinoIcons.person,
                  color: Colors.black,
                ),
                icon: Icon(
                  CupertinoIcons.person,
                  color: Colors.grey,
                ),
                label: 'profile')
          ]);
    });
  }
}
