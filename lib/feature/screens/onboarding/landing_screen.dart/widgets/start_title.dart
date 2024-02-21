import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';

class StartTitle extends StatelessWidget {
  const StartTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'Let\'s start the chat!',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: UIColors.black, fontSize: 23),
      ),
    );
  }
}
