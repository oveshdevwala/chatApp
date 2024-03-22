// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';
// import 'package:mangochatapp/constrains/colors.dart';

class MyContactTileRow extends StatelessWidget {
  MyContactTileRow({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: UIColors.white),
        ),
        Spacer(),
        Icon(
          Icons.more_horiz,
          size: 50,
        )
      ],
    );
  }
}
