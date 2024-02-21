import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';

class StartDiscription extends StatelessWidget {
  const StartDiscription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'Connect with friends and family securely and private. enjoy!',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w500, color: UIColors.grey, fontSize: 15),
      ),
    );
  }
}
