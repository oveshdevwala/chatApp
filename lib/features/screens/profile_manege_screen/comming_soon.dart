import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/constrains/widget/my_icon_button.dart';

class CommingSoonScreen extends StatelessWidget {
  const CommingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: UIColors.primary,
          leading: MyIconButton(
            onTap: () {
              Navigator.pop(context);
            },
            iconColor: UIColors.primary,
            icon: CupertinoIcons.back,
          )),
      backgroundColor: UIColors.white,
      body: Center(
        child: Text(
          'Comming Soon',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: UIColors.primary,
              fontSize: 30),
        ),
      ),
    );
  }
}
