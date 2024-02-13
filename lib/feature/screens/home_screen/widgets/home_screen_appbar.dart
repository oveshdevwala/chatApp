import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';

AppBar HomePageAppBAr() {
  return AppBar(
    backgroundColor: UIColors.greyShade100,
    surfaceTintColor: UIColors.greyShade100,
    elevation: 300,
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
