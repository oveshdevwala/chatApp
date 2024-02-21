import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';

Widget MyIconButton(
    {required VoidCallback onTap,
    required IconData icon,
    Color iconColor = Colors.black,
    double iconSize = 35}) {
  return IconButton(
    onPressed: onTap,
    style: IconButton.styleFrom(
      padding: EdgeInsets.all(4),
      // side: BorderSide(color: UIColors.black),
      backgroundColor: UIColors.greyShade100,
    ),
    icon: Icon(
      icon,
      color: iconColor,
      size: iconSize,
    ),
  );
}
