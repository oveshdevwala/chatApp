// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/message_model.dart';
import 'package:mangochatapp/feature/screens/chat_screen/widgets/read_recipt.dart';

class lastMessage extends StatelessWidget {
  lastMessage({super.key, required this.toId});
  String toId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseProvider.getLastMessage(toId: toId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            MessageModel message =
                MessageModel.fromDoc(snapshot.data!.docs.first.data());
            return message.fromId == FirebaseProvider.userId
                ? Row(
                    children: [
                      ReadRecipt(messageModel: message),
                      SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          message.messsage,
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 11,
                              color: UIColors.greyShade500,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                : Flexible(
                    child: Text(
                      message.messsage,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 11,
                          color: UIColors.greyShade500,
                          fontWeight: FontWeight.w500),
                    ),
                  );
          }
          return SizedBox();
        });
  }
}
