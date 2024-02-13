// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/models/message_model.dart';

class RightSideMessages extends StatelessWidget {
  RightSideMessages({super.key, required this.msgModel});
  MessageModel msgModel;

  @override
  Widget build(BuildContext context) {
    var sentTime = TimeOfDay.fromDateTime(
            DateTime.fromMillisecondsSinceEpoch(msgModel.sendAt))
        .format(context)
        .toString();

    String? readTime ;
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
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //     strokeAlign: 5, width: 1, color: UIColors.yellow),
                      color: UIColors.yellowShade500,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.zero,
                          bottomLeft: Radius.circular(12),
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                    ),
                    child: Text(
                      '${msgModel.messsage}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: UIColors.black),
                    )),
                SizedBox(height: 3),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      sentTime.toString(),
                      style: TextStyle(fontSize: 11),
                    ),
                    SizedBox(width: 5),
                    msgModel.readAt == null
                        ? AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.bounceInOut,
                            child: Icon(
                              Icons.done_all_rounded,
                              size: 20,
                              color: UIColors.greyShade400,
                              shadows: [
                                Shadow(color: UIColors.black, blurRadius: 1)
                              ],
                            ),
                          )
                        : AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.bounceOut,
                            child: Icon(
                              Icons.done_all_rounded,
                              size: 20,
                              shadows: [
                                Shadow(color: UIColors.black, blurRadius: 1)
                              ],
                              color: UIColors.yellowShade800,
                            ),
                          )
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