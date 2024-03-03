// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/data/datasource/local/database.dart';
import 'package:mangochatapp/features/app/global/date/time_formater.dart';
import 'package:mangochatapp/features/models/message_model.dart';
import 'package:mangochatapp/features/chat/presentation/widgets/read_recipt.dart';

reactDialogBox(context, {required MessageModel msgModel}) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: '',
    context: context,
    anchorPoint: Offset(20, 0),
    pageBuilder: (context, __, ___) {
      var mq = MediaQuery.of(context).size;
      return Material(
        color: Colors.transparent,
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Container(
                    width: mq.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: UIColors.greyShade200,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          msgModel.imageUrl == true
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(msgModel.fileUrl!))
                              : SizedBox(),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Material(
                                color: Colors.transparent,
                                child: ReadUnreadContainer(msgModel: msgModel)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: UIColors.primary,
                    child: Icon(
                      Icons.close,
                      color: UIColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
    var read = '- - - - - -';
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
              children: [
                ReadRecipt(messageModel: msgModel),
                SizedBox(width: 10),
                Text(
                  'Send',
                  style: TextStyle(
                      color: UIColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              getFormatedTime(msgModel.sendAt.toString(), context),
              style: TextStyle(
                  color: UIColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                ReadRecipt(messageModel: msgModel),
                SizedBox(width: 10),
                Text(
                  'Read',
                  style: TextStyle(
                      color: UIColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              read,
              style: TextStyle(
                  color: UIColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }
}

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
