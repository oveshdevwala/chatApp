// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/features/call/data/repositories_impl/agora_config.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallScreen extends StatefulWidget {
  CallScreen({super.key, required this.callId, required this.receiverId});
  String callId;
  String receiverId;
  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZegoUIKitPrebuiltCall(
          onDispose: () {
            FirebaseProvider.deleteCall(
                receiverId: widget.receiverId,
                senderId: FirebaseProvider.userId,
                context: context);
          },
          appID: ZegoConfig.appId,
          appSign: ZegoConfig.appSign,
          callID: '101',
          userID: FirebaseProvider.userId,
          userName:
              FirebaseProvider.auth.currentUser!.displayName ?? 'Null Name',
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()),
    );
  }
}


// import 'package:agora_uikit/agora_uikit.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mangochatapp/constrains/colors.dart';
// import 'package:mangochatapp/datasource/config/agora_config.dart';
// import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
// import 'package:mangochatapp/features/models/call_model.dart';

// class CallScreen extends StatefulWidget {
//   CallScreen({super.key, required this.callModel, required this.channelId});
//   String channelId;
//   CallModel callModel;

//   @override
//   State<CallScreen> createState() => _CallScreenState();
// }

// class _CallScreenState extends State<CallScreen> {
//   AgoraClient? client;
//   String tokenUrl = 'https://tolki-chat-app-fd94f8b8b67a.herokuapp.com/';
//   @override
//   void initState() {
//     super.initState();
//     //
//     client = AgoraClient(
//         agoraConnectionData: AgoraConnectionData(
//             appId: AgoraConfig.appId,
//             channelName: widget.channelId,
//             tokenUrl: tokenUrl));
//             //
//     initAgora();
//   }

//   initAgora() async {
//     await client!.initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: client == null
//             ? CircularProgressIndicator(color: UIColors.primary)
//             : SafeArea(
//                 child: Stack(
//                 children: [
//                   AgoraVideoViewer(client: client!),
//                   // intigrate Zego Cloud
//                   AgoraVideoButtons(
//                     client: client!,
//                     disconnectButtonChild: IconButton(
//                         onPressed: () async {
//                           await client!.engine.leaveChannel();
//                           FirebaseProvider.deleteCall(
//                               receiverId: widget.callModel.callerId,
//                               senderId: widget.callModel.receiverId,
//                               context: context);
//                           Navigator.pop(context);
//                         },
//                         highlightColor: UIColors.greyShade100,
//                         splashColor: UIColors.primary,
//                         icon: Icon(
//                           CupertinoIcons.phone_down_fill,
//                           color: UIColors.red,
//                           size: 55,
//                         )),
//                   )
//                 ],
//               )));
//   }
// }
