import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/screens/onboarding/widgets/text_field_border_decoration.dart';

class userNameField extends StatelessWidget {
  const userNameField({
    super.key,
    required this.userNameContoller,
  });

  final TextEditingController userNameContoller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'UserName Can\'t be empty';
        }
        return null;
      },
      controller: userNameContoller,
      decoration: InputDecoration(
          hintText: 'User Name',
          fillColor: UIColors.yellowShade100,
          filled: true,
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.person_2_outlined,
            color: UIColors.black,
          ),
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
            borderSide: BorderSide(color: UIColors.yellow, width: 2),
          )),
    );
  }
}
