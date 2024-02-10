// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/database.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/chat_screen/widgets/chat_screen_appbar.dart';

import 'widgets/received_msg.dart';
import 'widgets/sended_msg.dart';
import 'widgets/chat_page_bottom_navigation.dart';

class chat_colors {
  static Color received_text_colors = Color.fromARGB(106, 202, 192, 192);
  static Color sended_text_colors = Color(0xfffdc604);
}

class chat_ui extends StatelessWidget {
  chat_ui(
      {super.key,
      required this.name,
      required this.image,
      required this.cindex});
  String name;
  var cindex;
  String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: chatScreenAppBar(context, image: image, name: name),
      bottomNavigationBar: ChatPageBottomNavigation(),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Container(
                    alignment: Alignment.center,
                    child: Text("Today", style: TextStyle(color: Colors.grey))),
                SizedBox(height: 15),
                ReceivedMsg(colorbool: 1, messagesindex: received_messages[0]),
                SizedBox(height: 15),
                ReceivedMsg(colorbool: 1, messagesindex: received_messages[1]),
                SizedBox(height: 15),
                ReceivedMsg(colorbool: 1, messagesindex: received_messages[2]),
                SizedBox(height: 25),
                SendedMsg(
                    received_messages_index: 0, name: name, replayMsg: null),
                SizedBox(height: 15),
                SendedMsg(
                    received_messages_index: 1, name: name, replayMsg: null),
                SizedBox(height: 15),
                Container(
                    alignment: Alignment.bottomRight,
                    child: Text('Deilvered',
                        style: TextStyle(color: Colors.grey))),
              ],
            ),
          )),
    );
  }
}
