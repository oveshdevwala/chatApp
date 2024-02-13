// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/message_model.dart';

class LeftSideMessages extends StatelessWidget {
  MessageModel msgModel;
  LeftSideMessages({super.key, required this.msgModel, required this.toId});
String toId;
  @override
  Widget build(BuildContext context) {
    if(msgModel.readAt == null){
          FirebaseProvider.updateReadMessage(msgId: msgModel.messageId, userId: FirebaseProvider.userId, toId:toId );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 270, minWidth: 65),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                // border: Border.all(
                //     strokeAlign: 5, width: 1, color: UIColors.greyShade400),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: Colors.grey.shade300),
            child: Text(
              msgModel.messsage.trim(),
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: UIColors.black),
            ),
          ),
        ),
      ),
    );
  }
}
