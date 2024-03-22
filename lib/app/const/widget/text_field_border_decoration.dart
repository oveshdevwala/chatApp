import 'package:flutter/material.dart';

import 'package:mangochatapp/app/theme/colors_styles.dart';
InputDecoration onBoardingTextFieldDecoration(
    {required String hint, IconData? prefixIcon, Widget? sufixIcon}) {
  return InputDecoration(
      hintText: hint,
      suffixIcon: sufixIcon != null ? sufixIcon : null,
      prefixIcon: Icon(
        prefixIcon,
        color: UIColors.black,
      ),
      enabledBorder: myBorderDecoration(),
      focusedBorder: myBorderDecoration(),
      focusedErrorBorder: myErrorBorderDecoration(),
      disabledBorder: myDisableBorderDecoration(),
      errorBorder: myErrorBorderDecoration(),
      border: myBorderDecoration());
}

OutlineInputBorder myBorderDecoration() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: UIColors.black),
    borderRadius: BorderRadius.circular(10),
  );
}

OutlineInputBorder myErrorBorderDecoration() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: UIColors.red),
    borderRadius: BorderRadius.circular(10),
  );
}

OutlineInputBorder myDisableBorderDecoration() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: UIColors.red),
    borderRadius: BorderRadius.circular(10),
  );
}
