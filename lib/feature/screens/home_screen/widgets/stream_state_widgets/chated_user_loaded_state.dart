// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/constrains/widget/my_chat_tile.dart';
import 'package:mangochatapp/constrains/widget/primary_elevated_button.dart';
import 'package:mangochatapp/constrains/widget/user_profile_img.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:mangochatapp/feature/screens/chat_screen/chat_screen.dart';
import 'package:mangochatapp/feature/screens/home_screen/widgets/last_message.dart';
import 'package:mangochatapp/feature/screens/home_screen/widgets/un_read_count_widget.dart';

class ChatedUserLoadedState extends StatelessWidget {
  ChatedUserLoadedState({super.key, required this.snapshot});
  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) {
        var fromId = snapshot.data!.docs[index].data()['ids'][0];
        var toId = snapshot.data!.docs[index].data()['ids'][1];
        print('FromId : $fromId');
        print('ToId : $toId');
        List<String> ChatedUserId = [];
        if (fromId == FirebaseProvider.userId) {
          ChatedUserId.add(toId);
        } else if (toId == FirebaseProvider.userId) {
          ChatedUserId.add(fromId);
        }
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseProvider.getUserByFromIdAndToId(ChatedUserId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return AnimatedList(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  initialItemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index, animi) {
                    var userModel =
                        UserModel.fromDoc(snapshot.data!.docs[index].data());

                    if (userModel.id != FirebaseProvider.userId) {
                      return MyChatTile(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                'Delete This User Chat',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MyElevatedButton(
                                        bgColor: UIColors.primary,
                                        btName: 'Delete',
                                        onTap: () {
                                          Navigator.pop(context);
                                          FirebaseProvider.deleteChatCollation(
                                              userModel.id!);
                                        }),
                                    MyElevatedButton(
                                        bgColor: UIColors.greyShade200,
                                        btName: 'Back',
                                        onTap: () {
                                          Navigator.pop(context);
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 2),
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      ChatScreen(
                                        userModel: userModel,
                                        toId: userModel.id!,
                                      )));
                        },
                        userName: userModel.name,
                        profile: UserProfileIMG(
                          userContact: userModel,
                          iconSize: 40,
                        ),
                        lastMsg: lastMessage(toId: userModel.id!),
                        unReadMsg: unReadCountWidget(toId: userModel.id!),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: LinearProgressIndicator());
              }
              return SizedBox();
            });
      },
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  MyElevatedButton({
    super.key,
    required this.onTap,
    required this.btName,
    required this.bgColor,
  });
  VoidCallback onTap;
  String btName;
  Color bgColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor:
                bgColor == UIColors.primary ? UIColors.white : UIColors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Text(btName));
  }
}
