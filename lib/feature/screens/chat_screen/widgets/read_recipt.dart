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
        ? CircleAvatar(
            backgroundColor: UIColors.greyShade400,
            radius: 12,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.bounceInOut,
              child: Icon(
                Icons.done_all_rounded,
                size: 20,
                color: UIColors.white,
                // shadows: [Shadow(color: UIColors.black, blurRadius: 0)],
              ),
            ),
          )
        : CircleAvatar(
            backgroundColor: UIColors.greyShade200,
            radius: 12,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.bounceOut,
              child: Icon(
                Icons.done_all_rounded,
                size: 22,
                // shadows: [Shadow(color: UIColors.black, blurRadius: 0)],
                color: UIColors.primary,
              ),
            ),
          );
  }
}
