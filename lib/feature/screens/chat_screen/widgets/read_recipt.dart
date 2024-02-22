// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/models/message_model.dart';

class ReadRecipt extends StatelessWidget {
  ReadRecipt({super.key, required this.messageModel});
  MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return messageModel.readAt == null
        ? AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            curve: Curves.bounceInOut,
            child: Icon(
              Icons.done_all_rounded,
              size: 20,
              color: UIColors.grey,
              // shadows: [Shadow(color: UIColors.black, blurRadius: 0)],
            ),
          )
        : AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            curve: Curves.bounceOut,
            child: Icon(
              Icons.done_all_rounded,
              size: 22,
              // shadows: [Shadow(color: UIColors.black, blurRadius: 0)],
              color: UIColors.primary,
            ),
          );
  }
}
