// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';

class MyProfileEditTextField extends StatelessWidget {
  MyProfileEditTextField({
    super.key,
    required this.labelText,
    required this.textController,
  });
  String labelText;
  TextEditingController textController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.black),
      controller: textController,
      cursorColor: UIColors.primary,
      decoration: InputDecoration(
          fillColor: UIColors.greyShade200,
          filled: true,
          labelText: labelText,
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: UIColors.black),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none)),
    );
  }
}
