// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/features/chats/model/message_model.dart';
import 'package:mangochatapp/features/chats/screen/chat_screen/widgets/video_player.dart';

class LeftSideMessages extends StatelessWidget {
  MessageModel msgModel;
  LeftSideMessages({super.key, required this.msgModel, required this.toId});
  String toId;
  @override
  Widget build(BuildContext context) {
    if (msgModel.readAt == null) {
      FirebaseProvider.updateReadMessage(
          msgId: msgModel.messageId,
          userId: FirebaseProvider.userId,
          toId: toId);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 270, minWidth: 65),
          child: msgModel.imageUrl == false
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(msgModel.fileUrl!))
              : msgModel.videoUrl == true
                  ? VideoMsgPlayer(url: msgModel.fileUrl!)
                  : receiveTextMessage(msgModel: msgModel),
        ),
      ),
    );
  }
}

class receiveTextMessage extends StatelessWidget {
  const receiveTextMessage({
    super.key,
    required this.msgModel,
  });

  final MessageModel msgModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12)),
          color: UIColors.greyShade100),
      child: msgModel.imageUrl == true
          ? Container(
              decoration: BoxDecoration(
                  color: UIColors.greyShade200,
                  borderRadius: BorderRadius.circular(12)),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(msgModel.fileUrl!),
                        fit: BoxFit.cover)),
              ),
            )
          : Text(
              msgModel.messsage.trim(),
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: UIColors.black),
            ),
    );
  }
}
