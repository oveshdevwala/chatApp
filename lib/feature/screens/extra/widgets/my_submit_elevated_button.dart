// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';

class MySubmitElevatedButton extends StatelessWidget {
  MySubmitElevatedButton(
      {super.key, required this.btName, required this.onTap, this.myChild});
  String btName;
  VoidCallback onTap;
  Widget? myChild;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: UIColors.blueShade400),
            child: myChild == null
                ? FittedBox(
                    child: Text(
                      btName,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: UIColors.white),
                    ),
                  )
                : myChild));
  }
}
