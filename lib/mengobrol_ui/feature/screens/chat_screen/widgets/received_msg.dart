// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/chat_screen/chat_screen.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/chat_screen/widgets/react_dialog_box.dart';

class ReceivedMsg extends StatefulWidget {
  String messagesindex;
  int colorbool;
  double fontsize;
  FontWeight fontWeightdot;
  Color? messagecolor = chat_colors.received_text_colors;
  ReceivedMsg(
      {super.key,
      this.fontWeightdot = FontWeight.normal,
      this.fontsize = 13,
      required this.messagesindex,
      this.messagecolor,
      required this.colorbool});

  @override
  State<ReceivedMsg> createState() => _ReceivedMsgState();
}

class _ReceivedMsgState extends State<ReceivedMsg> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        reactDialogBox(context, message: widget.messagesindex);
        setState(() {});
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 270),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            widget.messagesindex,
            softWrap: true,
            style: TextStyle(
                height: 1.3,
                fontSize: widget.fontsize,
                fontWeight: widget.fontWeightdot),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.colorbool == 1
                ? chat_colors.received_text_colors
                : chat_colors.sended_text_colors,
          ),
        ),
      ),
    );
  }


}
