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

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.toId, required this.userModel});
  String toId;
  UserModel userModel;
  ScrollController scrollContoller = ScrollController();
  @override
  Widget build(BuildContext context) {
    print('Chat Screen build Called!!');
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
                return Container(
                  color: UIColors.white,
                );
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
                                msgModel: eachMsg, toId: toId);
                          }
                        },
                      ),
                      SizedBox(height: 70)
                    ],
                  ),
                ),
              );
            },
          ),
          SendMessageBar(userModel: userModel)
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