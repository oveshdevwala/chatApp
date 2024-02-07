
  import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/home_screen/home_screen.dart';

AppBar HomePageAppBAr() {
    return AppBar(
      backgroundColor: ui_colors.homebgcolor,
      elevation: 0,
      leadingWidth: 0,
      title: Text(
        'Mengobrol',
        style: TextStyle(color: Colors.black, fontSize: 23),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.search_rounded,
            color: Colors.black,
            size: 35,
          ),
        ),
      ],
    );
  }