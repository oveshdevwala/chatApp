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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: UIColors.yellow),
            child: myChild == null
                ? FittedBox(
                    child: Text(
                      btName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: UIColors.black),
                    ),
                  )
                : myChild));
  }
}
