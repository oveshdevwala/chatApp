// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';

class MyOutlineButton extends StatelessWidget {
   MyOutlineButton({
    super.key,
    required this.btName,
    required this.onTap,
  });
  VoidCallback onTap;
  String btName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
              side: BorderSide(color: UIColors.yellow, width: 3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
          child: FittedBox(
            child: Text(
              btName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: UIColors.black,
                  fontSize: 18),
            ),
          )),
    );
  }
}
