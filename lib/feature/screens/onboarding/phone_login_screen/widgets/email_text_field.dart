// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/text_field_border_decoration.dart';

class EmailTextField extends StatelessWidget {
  EmailTextField({super.key, required this.emailContoller});
  TextEditingController emailContoller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailContoller,
      validator: (value) {
        const pattern =
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
        final regExp = RegExp(pattern);
        if (value!.isEmpty) {
          return 'Email Can\'t be empty';
        } else if (!regExp.hasMatch(value)) {
          return "Email Must Be gmail.com";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(
            Icons.email_outlined,
            color: UIColors.black,
          ),
          contentPadding: EdgeInsets.all(0),
          filled: true,
          prefixStyle: TextStyle(color: UIColors.black),
          fillColor: UIColors.yellowShade100,
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: UIColors.black,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: UIColors.yellow, width: 2)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: myErrorBorderDecoration(),
          disabledBorder: myDisableBorderDecoration(),
          errorBorder: myErrorBorderDecoration(),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: UIColors.yellow, width: 2))),
    );
  }
}
