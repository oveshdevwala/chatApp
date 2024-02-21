// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/screens/extra/widgets/text_field_border_decoration.dart';

class PasswordTextFormField extends StatefulWidget {
  PasswordTextFormField({
    super.key,
    required this.mContoller,
    required this.validator,
  });
  TextEditingController mContoller;
  String? Function(String? value) validator;

  bool seePassword = false;
  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: widget.validator,
        controller: widget.mContoller,
        obscureText: widget.seePassword,
        decoration: InputDecoration(
            hintText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                widget.seePassword
                    ? Icons.lock_outline_rounded
                    : Icons.lock_open_rounded,
                color: UIColors.black,
              ),
              onPressed: () {
                widget.seePassword = !widget. seePassword;
                setState(() {});
              },
            ),
            prefixIcon: Icon(Icons.password_outlined),
            enabledBorder: myBorderDecoration(),
            focusedBorder: myBorderDecoration(),
            focusedErrorBorder: myErrorBorderDecoration(),
            disabledBorder: myDisableBorderDecoration(),
            errorBorder: myErrorBorderDecoration(),
            border: myBorderDecoration()));
  }
}
