// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/constrains/widget/user_profile_img.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/features/models/call_model.dart';
import 'package:mangochatapp/features/screens/call/call_screen.dart';

class CallScaffold extends StatefulWidget {
  CallScaffold({super.key, required this.child});
  final Widget child;
  @override
  State<CallScaffold> createState() => _CallScaffoldState();
}

class _CallScaffoldState extends State<CallScaffold> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseProvider.callStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.exists) {
            CallModel callModel = CallModel.fromMap(snapshot.data!.data()!);
            if (!callModel.hasDialled) {
              return CallPickUpScreen(callModel: callModel);
            }
          }
          return widget.child;
        });
  }
}

class CallPickUpScreen extends StatelessWidget {
  CallPickUpScreen({super.key, required this.callModel});
  CallModel callModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.black,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Incomming Call",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: UIColors.white),
            ),
            Column(
              children: [
                NewContactProfileIcon(iconSize: 75, profilePic: null),
                SizedBox(height: 30),
                FittedBox(
                    child: Text(
                  'ovesh Devwala',
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: UIColors.white,
                      fontSize: 24),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      FirebaseProvider.deleteCall(
                          receiverId: callModel.callerId,
                          senderId: callModel.receiverId,
                          context: context);
                    },
                    highlightColor: UIColors.greyShade100,
                    splashColor: UIColors.primary,
                    icon: Icon(
                      CupertinoIcons.phone_down_fill,
                      color: UIColors.red,
                      size: 55,
                    )),
                SizedBox(width: 20),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CallScreen(
                                receiverId: callModel.receiverId,
                                callId: callModel.callId),
                          ));
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => CallScreen(
                      //           callModel: callModel,
                      //           channelId: callModel.callId),
                      //     ));
                    },
                    highlightColor: UIColors.greyShade100,
                    splashColor: UIColors.primary,
                    icon: Icon(
                      CupertinoIcons.phone_fill,
                      color: UIColors.green,
                      size: 55,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
