import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/constrains/widget/my_icon_button.dart';

AppBar myAccountAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: UIColors.primary,
    leading: SizedBox(),
    leadingWidth: 0,
    toolbarHeight: 60,
    title: Row(
      children: [
        MyIconButton(
            onTap: () {
              Navigator.pop(context);
            },
            iconColor: UIColors.primary,
            icon: CupertinoIcons.back),
        SizedBox(width: 20),
        Text(
          'Account Details',
          style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.white),
        ),
      ],
    ),
  );
}
