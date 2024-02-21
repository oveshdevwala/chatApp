// ignore_for_file: must_be_immutable

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:mangochatapp/constrains/colors.dart';
// import 'package:mangochatapp/constrains/widget/my_chat_tile.dart';
// import 'package:mangochatapp/constrains/widget/user_profile_img.dart';
// import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
// import 'package:mangochatapp/feature/models/user_model.dart';
// import 'package:mangochatapp/feature/screens/chat_screen/chat_screen.dart';
// import 'package:mangochatapp/feature/screens/home_screen/widgets/last_message.dart';
// import 'package:mangochatapp/feature/screens/home_screen/widgets/un_read_count_widget.dart';

// class StreamStateChatList extends StatelessWidget {
//   StreamStateChatList({super.key, required this.snapshot});
//   Stream<QuerySnapshot<Map<String, dynamic>>> snapshot;
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         stream: snapshot,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: LinearProgressIndicator(
//                 color: UIColors.blueShade600,
//               ),
//             );
//           }
//           if (snapshot.hasError) {
//             return Center(
//               child: LinearProgressIndicator(
//                 color: UIColors.red,
//               ),
//             );
//           }
//           List<UserModel> myUserModel = [];
//           for (int i = 0; i < snapshot.data!.docs.length; i++) {
//             UserModel user = UserModel.fromDoc(snapshot.data!.docs[i].data());
//             if (user.id != FirebaseProvider.userId) {
//             myUserModel.add(UserModel.fromDoc(snapshot.data!.docs[i].data()));
//             }
//           }
//           // if (myUserModel.isNotEmpty) {
//           //   var chatId = FirebaseProvider.getChatId(
//           //       fromId: FirebaseProvider.userId, toId: myUserModel[0].id!);
//           //   print('Chat ID :$chatId');
//           // }
//           return myUserModel.isNotEmpty
//               ? SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: ListView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: myUserModel.length,
//                       itemBuilder: (context, index) {
//                         var myConatctUser = myUserModel[index];
//                         return MyChatTile(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 PageRouteBuilder(
//                                     transitionDuration: Duration(seconds: 2),
//                                     pageBuilder: (context, animation,
//                                             secondaryAnimation) =>
//                                         ChatScreen(
//                                           userModel: myConatctUser,
//                                           toId: myConatctUser.id!,
//                                         )));
//                           },
//                           userName: myConatctUser.name,
//                           profile: UserProfileIMG(
//                             userContact: myConatctUser,
//                             iconSize: 40,
//                           ),
//                           lastMsg: lastMessage(toId: myConatctUser.id!),
//                           unReadMsg: unReadCountWidget(toId: myConatctUser.id!),
//                         );
//                       },
//                     ),
//                   ),
//                 )
//               : Center(
//                   child: LinearProgressIndicator(color: UIColors.black),
//                 );
//         });
//   }
// }
// // ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/feature/models/user_model.dart';

class StreamStateChatList extends StatelessWidget {
  StreamStateChatList({super.key, required this.snapshot});
  // AsyncSnapshot<Stream<QuerySnapshot<Map<String, dynamic>>>> snapshot;
  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
  @override
  Widget build(BuildContext context) {
    print('Chat Home screen uild function called!!!');
    // print('${snapshot.data!.docs[0].data()['toId']}');
    List<String> myUserIds = [];
    for (int i = 0; i < snapshot.data!.docs.length; i++) {
      // UserModel user = UserModel.fromDoc(snapshot.data!.docs[i].data());
      // if (snapshot.data!.docs[i].id != FirebaseProvider.userId ) {
      // myUserIds.add(
      //     MessageModel.fromDoc(snapshot.data!.docs[i].data()).toId.toString());
      myUserIds
          .add(UserModel.fromDoc(snapshot.data!.docs[i].data()).id.toString());
      // }
      print('Filtared User Id :${myUserIds[0]}');
    }
  
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: myUserIds.length,
      itemBuilder: (context, index) {
        print('Filtared User Id :${myUserIds[0]}');
        return ListTile(
          title: Text(myUserIds[index]),
        );
      },
    );
    // return myUserIds.isNotEmpty
    //     ? StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    //         stream: FirebaseProvider.fireStore
    //             .collection(FirebaseProvider.userCollection)
    //             .where(FieldPath.documentId, arrayContains: myUserIds)
    //             .snapshots(),
    //         builder: (context, snapshot) {
    //           if (snapshot.connectionState == ConnectionState.waiting) {
    //             return LinearProgressIndicator();
    //           }
    //           if (snapshot.hasData) {
    //             List<UserModel> myUserModel = [];
    //             for (int i = 0; i < snapshot.data!.docs.length; i++) {
    //               // UserModel user = UserModel.fromDoc(snapshot.data!.docs[i].data());
    //               if (snapshot.data!.docs[i].id != FirebaseProvider.userId) {
    //                 myUserModel
    //                     .add(UserModel.fromDoc(snapshot.data!.docs[i].data()));
    //                 // myUserModel
    //                 //     .add(UserModel.fromDoc(snapshot.data!.docs[i].data()));
    //               }
    //             }

    //             // return SingleChildScrollView(
    //             //   child: Padding(
    //             //     padding: const EdgeInsets.all(12),
    //             //     child: ListView.builder(
    //             //       physics: NeverScrollableScrollPhysics(),
    //             //       shrinkWrap: true,
    //             //       itemCount: myUserModel.length,
    //             //       itemBuilder: (context, index) {
    //             //         var myConatctUser = myUserModel[index];

    //             //         return MyChatTile(
    //             //           onTap: () {
    //             //             Navigator.push(
    //             //                 context,
    //             //                 PageRouteBuilder(
    //             //                     transitionDuration: Duration(seconds: 2),
    //             //                     pageBuilder: (context, animation,
    //             //                             secondaryAnimation) =>
    //             //                         ChatScreen(
    //             //                           userModel: myConatctUser,
    //             //                           toId: myConatctUser.id!,
    //             //                         )));
    //             //           },
    //             //           userName: myConatctUser.name,
    //             //           profile: UserProfileIMG(
    //             //             userContact: myConatctUser,
    //             //             iconSize: 40,
    //             //           ),
    //             //           lastMsg: lastMessage(toId: myConatctUser.id!),
    //             //           unReadMsg: unReadCountWidget(toId: myConatctUser.id!),
    //             //         );
    //             //       },
    //             //     ),
    //             //   ),
    //             // );
    //           }
    //           return SizedBox();
    //         })
    //     : Center(
    //         child: LinearProgressIndicator(),
    //       );
  }
}
// class StreamStateChatList extends StatelessWidget {
//   StreamStateChatList({super.key, required this.snapshot});
//   // AsyncSnapshot<Stream<QuerySnapshot<Map<String, dynamic>>>> snapshot;
//   AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot;
//   @override
//   Widget build(BuildContext context) {
//     List<UserModel> myUserModel = [];
//     for (int i = 0; i < snapshot.data!.docs.length; i++) {
//       // UserModel user = UserModel.fromDoc(snapshot.data!.docs[i].data());
//       if (snapshot.data!.docs[i].id != FirebaseProvider.userId) {
//         myUserModel.add(UserModel.fromDoc(snapshot.data!.docs[i].data()));
//       }
//     }
//     if (myUserModel.isNotEmpty) {
//       var chatId = FirebaseProvider.getChatId(
//           fromId: FirebaseProvider.userId, toId: myUserModel[0].id!);
//       print('Chat ID :$chatId');
//     }
//     return myUserModel.isNotEmpty
//         ? SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: myUserModel.length,
//                 itemBuilder: (context, index) {
//                   var myConatctUser = myUserModel[index];

//                   return MyChatTile(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           PageRouteBuilder(
//                               transitionDuration: Duration(seconds: 2),
//                               pageBuilder:
//                                   (context, animation, secondaryAnimation) =>
//                                       ChatScreen(
//                                         userModel: myConatctUser,
//                                         toId: myConatctUser.id!,
//                                       )));
//                     },
//                     userName: myConatctUser.name,
//                     profile: UserProfileIMG(
//                       userContact: myConatctUser,
//                       iconSize: 40,
//                     ),
//                     lastMsg: lastMessage(toId: myConatctUser.id!),
//                     unReadMsg: unReadCountWidget(toId: myConatctUser.id!),
//                   );
//                 },
//               ),
//             ),
//           )
//         : Center(
//             child: LinearProgressIndicator(),
//           );
//   }
// }
