// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/message_model.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:mangochatapp/feature/screens/chat_screen/widgets/chat_screen_appbar.dart';
import 'package:mangochatapp/feature/screens/chat_screen/widgets/left_side_msg.dart';
import 'package:mangochatapp/feature/screens/chat_screen/widgets/right_side_msg.dart';

import 'widgets/send_messages_textfield.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.toId, required this.userModel});
  String toId;
  UserModel userModel;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollContoller = ScrollController();
  // bool showSplash = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.greyShade100,
      appBar: chatScreenAppBar(context, user: widget.userModel),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: StreamBuilder(
              stream: FirebaseProvider.getAllMesage(
                  toId: widget.toId,
                  userID: FirebaseProvider.auth.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(color: UIColors.greyShade100);
                }
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  scrollContoller.animateTo(
                    scrollContoller.position.maxScrollExtent,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                  );
                });
                return SingleChildScrollView(
                  controller: scrollContoller,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            MessageModel eachMsg = MessageModel.fromDoc(
                                snapshot.data!.docs[index].data());
                            if (eachMsg.fromId == FirebaseProvider.userId) {
                              return RightSideMessages(msgModel: eachMsg);
                            } else {
                              return LeftSideMessages(
                                  msgModel: eachMsg, toId: widget.toId);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(flex: 1, child: SendMessageBar(toId: widget.toId))
        ],
      ),
    );
  }
}
/*  Consumer<NewMsgSplashProvidewr>(
                          builder: (context, provider, child) {
                        return AnimatedOpacity(
                            duration: Duration(milliseconds: 400),
                            opacity: 1,
                            child: Container(
                              height: 5,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                    blurRadius: 40,
                                    color: UIColors.yellow,
                                    spreadRadius: 5)
                              ]),
                            ));
                      }),*/