import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/constrains/widget/my_icon_button.dart';
import 'package:mangochatapp/features/state_manegment/screen_provider.dart';
import 'package:provider/provider.dart';

AppBar HomePageAppBAr(BuildContext context) {
  return AppBar(
    backgroundColor: UIColors.primary,
    surfaceTintColor: UIColors.primary,
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
      return Row(
        children: [
          Text(
            screenTitle,
            style: TextStyle(
                color: UIColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          Spacer(),
          provider.screenIndex == 0
              ? MyIconButton(
                  onTap: () {},
                  icon: CupertinoIcons.search,
                  iconSize: 30,
                  iconColor: UIColors.primary)
              : SizedBox(),
        ],
      );
    }),
  );
}
