// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/constrains/time/time_formater.dart';
import 'package:mangochatapp/datasource/local/database.dart';
import 'package:mangochatapp/feature/models/message_model.dart';

reactDialogBox(context, {required MessageModel msgModel}) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    pageBuilder: (_, __, ___) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: UIColors.blueShade300,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          ReadUnreadContainer(msgModel: msgModel),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

class ReadUnreadContainer extends StatelessWidget {
  ReadUnreadContainer({
    super.key,
    required this.msgModel,
  });
  MessageModel msgModel;
  @override
  Widget build(BuildContext context) {
    var read = '- - - -';
    if (msgModel.readAt != null) {
      read = "${getFormatedTime(msgModel.readAt!.toString(), context)}";
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: UIColors.blueShade200,
                  radius: 9,
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
                ),
                SizedBox(width: 10),
                Text(
                  'Send',
                  style: TextStyle(color: UIColors.white),
                ),
              ],
            ),
            Text(
              getFormatedTime(msgModel.sendAt.toString(), context),
              style: TextStyle(color: UIColors.white),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                msgModel.readAt != null
                    ? CircleAvatar(
                        backgroundColor: UIColors.blueShade200,
                        radius: 9,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.bounceInOut,
                          child: Icon(
                            Icons.done_all_rounded,
                            size: 20,
                            color: UIColors.blueShade600,
                            // shadows: [Shadow(color: UIColors.black, blurRadius: 0)],
                          ),
                        ))
                    : SizedBox(),
                SizedBox(width: 10),
                Text(
                  'Read',
                  style: TextStyle(color: UIColors.white),
                ),
              ],
            ),
            Text(
              read,
              style: TextStyle(color: UIColors.white),
            )
          ],
        ),
      ],
    );
  }
}
// SizedBox(height: 5),
//                           myDivider(),
//                           SizedBox(height: 7),
//                           reactedMsg(msgModel.messsage),
//                           SizedBox(height: 10),
//                           reactIconButtons(),
//                           SizedBox(height: 15),
//                           MsgCopyButton(),
//                           SizedBox(height: 20),
//                           msgReplayButton(),
//                           SizedBox(height: 20),
//                           msgForwardButton(),
//                           SizedBox(height: 20),
//                           msgDeleteButton(),
//                           SizedBox(height: 20)

Row msgDeleteButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Delete",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      Icon(
        CupertinoIcons.delete,
        size: 18,
        color: Colors.black,
      ),
    ],
  );
}

Row msgForwardButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Forward",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      Icon(
        Icons.turn_right_rounded,
        size: 18,
        color: Colors.black,
      ),
    ],
  );
}

Row msgReplayButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Reply",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      Icon(
        CupertinoIcons.arrow_turn_up_left,
        color: Colors.black,
        size: 18,
      ),
    ],
  );
}

Row MsgCopyButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Copy",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      Icon(
        size: 18,
        Icons.copy,
        color: Colors.black,
      ),
    ],
  );
}

Column reactIconButtons() {
  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "React",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      SizedBox(height: 10),
      ConstrainedBox(
        // height: 40,
        constraints: BoxConstraints(maxHeight: 40),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: emojisdata.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                // color: Colors.red,
                // height: 50, width: 50,
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Image.asset(
                  emojisdata[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}

Container reactedMsg(String message) {
  return Container(
    padding: EdgeInsets.all(25),
    margin: EdgeInsets.all(8),
    child: Text(message),
    decoration: BoxDecoration(
        color: Color(0xfff7f7f7), borderRadius: BorderRadius.circular(25)),
  );
}

SizedBox myDivider() {
  return SizedBox(
    width: 50,
    child: Divider(
      color: Color(0xffdedede),
      height: 3,
      thickness: 5,
    ),
  );
}
