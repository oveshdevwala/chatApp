import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/constrains/widget/my_icon_button.dart';
import 'package:mangochatapp/feature/state_manegment/screen_provider.dart';
import 'package:provider/provider.dart';

AppBar HomePageAppBAr(BuildContext context) {
  // var screenIndex = context.read<ScreenProvider>().screenIndex;
  // // context.read<ScreenProvider>().appbarTextProvider();
  // var screenTitle = 'Chats';
  // // appbarTextProvider() {
  // if (screenIndex == 0) {
  //   screenTitle = 'Chats';
  // } else if (screenIndex == 1) {
  //   screenTitle = 'Status';
  // } else if (screenIndex == 2) {
  //   screenTitle = 'Calls';
  // } else {
  //   screenTitle = "Account";
  // }

  return AppBar(
    backgroundColor: UIColors.blueShade400,
    surfaceTintColor: UIColors.blueShade400,
    elevation: 300,
    leadingWidth: 0,
    title: Consumer<ScreenProvider>(builder: (context, provider, child) {
      var screenIndex = context.read<ScreenProvider>().screenIndex;
      var screenTitle = 'Chats';
      if (screenIndex == 0) {
        screenTitle = 'Chats';
      } else if (screenIndex == 1) {
        screenTitle = 'Status';
      } else if (screenIndex == 2) {
        screenTitle = 'Calls';
      } else {
        screenTitle = "Account";
      }
      return AppBar(
        backgroundColor: UIColors.blueShade400,
        surfaceTintColor: UIColors.blueShade400,
        elevation: 300,
        leadingWidth: 0,
        title: Text(
          screenTitle,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          provider.screenIndex == 0
              ? MyIconButton(
                  onTap: () {},
                  icon: CupertinoIcons.search,
                  iconSize: 30,
                )
              : SizedBox(),
        ],
      );
    }),
  );
}
