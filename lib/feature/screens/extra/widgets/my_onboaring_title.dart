// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';

class MyOnboardingTitle extends StatelessWidget {
  MyOnboardingTitle(
    this.title, {
    super.key,
  });
  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: UIColors.black, fontSize: 22),
    );
  }
}
