// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/database.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/chat_screen/chatpage.dart';

import 'received_msg.dart';

class SendedMsg extends StatelessWidget {
  SendedMsg({
    super.key,
    required this.received_messages_index,
    required this.name,
    required this.replayMsg,
  });
  String name;
  int received_messages_index;
  String? replayMsg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 270),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: chat_colors.sended_text_colors,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                // color: Colors.white,
                child: replayMsg == null
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
                              Text(name),
                              Text('What should i call u?'),
                            ],
                          ),
                        ],
                      )
                    : Text(name),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: ReceivedMsg(
                    colorbool: 2,
                    messagesindex: send_messages[received_messages_index],
                    messagecolor: chat_colors.sended_text_colors),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
