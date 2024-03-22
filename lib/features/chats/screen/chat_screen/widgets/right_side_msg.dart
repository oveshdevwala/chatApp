// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';
import 'package:mangochatapp/features/chats/model/message_model.dart';
import 'package:mangochatapp/features/chats/screen/chat_screen/widgets/react_dialog_box.dart';
import 'package:mangochatapp/features/chats/screen/chat_screen/widgets/read_recipt.dart';
import 'package:mangochatapp/features/chats/screen/chat_screen/widgets/video_player.dart';

class RightSideMessages extends StatelessWidget {
  RightSideMessages({super.key, required this.msgModel});
  MessageModel msgModel;

  @override
  Widget build(BuildContext context) {
    var sentTime = TimeOfDay.fromDateTime(
            DateTime.fromMillisecondsSinceEpoch(msgModel.sendAt))
        .format(context)
        .toString();

    String readTime = '';
    print(readTime);
    if (msgModel.readAt != null) {
      readTime = TimeOfDay.fromDateTime(
              DateTime.fromMillisecondsSinceEpoch(msgModel.readAt!))
          .format(context)
          .toString();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 270, minWidth: 65),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    if (msgModel.imageUrl != null) {
                      if (msgModel.imageUrl!) {
                        reactDialogBox(context, msgModel: msgModel);
                      } else {
                        null;
                      }
                    }
                  },
                  onLongPress: () {
                    reactDialogBox(context, msgModel: msgModel);
                  },
                  child: Container(
                      padding: EdgeInsets.all(
                          msgModel.imageUrl == true || msgModel.videoUrl == true
                              ? 5
                              : 10),
                      decoration: BoxDecoration(
                        color: UIColors.primary,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.zero,
                            bottomLeft: Radius.circular(12),
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                      ),
                      child: msgModel.imageUrl == true
                          ? ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.zero,
                                  bottomLeft: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                              child: Image.network(msgModel.fileUrl!))
                          : msgModel.videoUrl == true
                              ? VideoMsgPlayer(
                                  url: msgModel.fileUrl!,
                                )
                              : Text(
                                  '${msgModel.messsage}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: UIColors.white),
                                )),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Spacer(),
                    Text(sentTime.toString(), style: TextStyle(fontSize: 11)),
                    SizedBox(width: 5),
                    ReadRecipt(messageModel: msgModel),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/**  Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                // color: Colors.white,
                child: ,
                child:
                    msgModel.replayedMsg != null && msgModel.replayedMsg != ''
                        ? Row(
                            children: [
                              Container(
                                height: 40,
                                color: Colors.black,
                                width: 1,
                              ),
                              SizedBox(width: 7),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(msgModel.messsage),
                                  Text(msgModel.replayedMsg!),
                                ],
                              ),
                            ],
                          )
                        : Text(msgModel.messsage),
              ),
            ],
          ), */