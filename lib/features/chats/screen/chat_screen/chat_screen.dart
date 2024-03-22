// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/features/chats/model/chat_screen_arg.dart';
import 'package:mangochatapp/features/chats/model/message_model.dart';
import 'package:mangochatapp/features/chats/screen/chat_screen/widgets/chat_screen_appbar.dart';
import 'package:mangochatapp/features/chats/screen/chat_screen/widgets/left_side_msg.dart';
import 'package:mangochatapp/features/chats/screen/chat_screen/widgets/right_side_msg.dart';
import 'package:mangochatapp/features/chats/screen/chat_screen/widgets/send_messages_textfield.dart';

class ChatScreen extends StatelessWidget {
  ScrollController scrollContoller = ScrollController();
  @override
  Widget build(BuildContext context) {
    print('Chat Screen build Called!!');
    var arg = ModalRoute.of(context)!.settings.arguments as ChatScreenArguments;
    final toId = arg.toId;
    final userModel = arg.userModel;
    return Scaffold(
        backgroundColor: UIColors.white,
        appBar: chatScreenAppBar(context, toId: toId),
        body: Stack(
          children: [
            StreamBuilder(
              stream: FirebaseProvider.getAllMesage(
                  toId: toId, userID: FirebaseProvider.auth.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LinearProgressIndicator();
                }
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  scrollContoller.animateTo(
                    scrollContoller.position.maxScrollExtent,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                  );
                });
                return messageWidgets(
                  scrollContoller: scrollContoller,
                  toId: toId,
                  snapshot: snapshot,
                );
              },
            ),
            SendMessageBar(userModel: userModel)
          ],
        ),
      
    );
  }
}

/**    StreamBuilder(
              stream: FirebaseProvider.getAllMesage(
                  toId: toId, userID: FirebaseProvider.auth.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LinearProgressIndicator();
                }

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  scrollContoller.animateTo(
                    scrollContoller.position.maxScrollExtent,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                  );
                });
                return messageWidgets(scrollContoller: scrollContoller, toId: toId);
              },
            ), */
class messageWidgets extends StatelessWidget {
  messageWidgets({
    super.key,
    required this.scrollContoller,
    required this.toId,
    required this.snapshot,
  });
  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;

  final ScrollController scrollContoller;
  final String toId;

  @override
  Widget build(BuildContext context) {
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
                MessageModel eachMsg =
                    MessageModel.fromDoc(snapshot.data!.docs[index].data());
                if (eachMsg.fromId == FirebaseProvider.userId) {
                  return RightSideMessages(msgModel: eachMsg);
                } else {
                  return LeftSideMessages(msgModel: eachMsg, toId: toId);
                }
              },
            ),
            SizedBox(height: 50)
          ],
        ),
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