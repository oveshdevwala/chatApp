// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/database.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/chat_screen/chatpage.dart';

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
        customdialogmessage(context, message: widget.messagesindex);
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

  customdialogmessage(context, {required String message}) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (_, __, ___) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: AnimatedContainer(
                duration: Duration(seconds: 3),
                alignment: Alignment.bottomCenter,
                // height: 250,
                // width: 300,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                padding: EdgeInsets.all(10),

                child: Material(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                          height: 375,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              SizedBox(height: 5),
                              SizedBox(
                                width: 50,
                                child: Divider(
                                  color: Color(0xffdedede),
                                  height: 3,
                                  thickness: 5,
                                ),
                              ),
                              SizedBox(height: 7),
                              Container(
                                padding: EdgeInsets.all(25),
                                margin: EdgeInsets.all(8),
                                child: Text(message),
                                decoration: BoxDecoration(
                                    color: Color(0xfff7f7f7),
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "React",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
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
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 7),
                                        child: Image.asset(
                                          emojisdata[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Copy",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    size: 18,
                                    Icons.copy,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              // Divider(
                              //   color: Color(0xffdedede),
                              //   height: 15,
                              //   thickness: 1,
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Reply",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    CupertinoIcons.arrow_turn_up_left,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              // Divider(
                              //   color: Color(0xffdedede),
                              //   height: 15,
                              //   thickness: 1,
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Forward",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.turn_right_rounded,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              // Divider(
                              //   color: Color(0xffdedede),
                              //   height: 15,
                              //   thickness: 1,
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delete",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    CupertinoIcons.delete,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SizedBox(height: 15)
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
