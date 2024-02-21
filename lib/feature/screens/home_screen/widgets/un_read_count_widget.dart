// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/constrains/time/time_formater.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/message_model.dart';

class unReadCountWidget extends StatelessWidget {
  unReadCountWidget({super.key, required this.toId});
  String toId;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseProvider.getLastMessage(toId: toId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                MessageModel message =
                    MessageModel.fromDoc(snapshot.data!.docs.first.data());
                return Text(
                  getFormatedTime(message.sendAt.toString(), context),
                  style: TextStyle(color: UIColors.greyShade200),
                );
              }
              return SizedBox();
            }),
        SizedBox(height: 5),
        StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseProvider.getUnreadCount(toId: toId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CircleAvatar(
                  radius: snapshot.data!.docs.length == 0 ? 0 : 11,
                  child: Text(
                    snapshot.data!.docs.length.toString(),
                    style: TextStyle(color: UIColors.white),
                  ),
                  backgroundColor: UIColors.blueShade600,
                );
              }
              return SizedBox();
            }),
      ],
    );
  }
}
// class MyChatList extends snapshotlessWidget {
//   const MyChatList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 3),
//           child: MyContactTileRow(title: 'Chats'),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: ListView.builder(
//             itemCount: contact_data.length,
//             itemExtent: 80,
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 onTap: () {
//                   // problem
//                   // Navigator.pushNamed(context, AppRoutes.newChatScreen);
//                   Navigator.push(
//                       context,
//                       PageRouteBuilder(
//                         transitionDuration: Duration(seconds: 2),
//                         pageBuilder: (context, animation, secondaryAnimation) =>
//                            ChatScreen(toId: 'toId')
//                       ));
//                 },
//                 contentPadding: EdgeInsets.symmetric(
//                   horizontal: 0,
//                 ),
//                 minVerticalPadding: 10,
//                 leading: CircleAvatar(
//                   radius: 30,
//                   backgroundColor: Colors.yellow,
//                   backgroundImage:
//                       AssetImage(contact_data[index]['profileimage']),
//                 ),
//                 title: Text(
//                   contact_data[index]['name'],
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 subtitle: Text(
//                   contact_data[index]['message'],
//                   style: TextStyle(
//                       overflow: TextOverflow.ellipsis,
//                       fontSize: 12.5,
//                       color: contact_data[index]['readUndread'] == ''
//                           ? Colors.black54
//                           : Colors.black,
//                       fontWeight: contact_data[index]['readUndread'] == ''
//                           ? FontWeight.normal
//                           : FontWeight.w500),
//                 ),
//                 trailing: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text('02.11'),
//                     SizedBox(height: 5),
//                     CircleAvatar(
//                       radius: contact_data[index]['readUndread'] == '' ? 0 : 10,
//                       child: Text(
//                         contact_data[index]['readUndread'],
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       backgroundColor: UIColors.unreadcirclecolor,
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
   // floatingActionButton: SizedBox(
        //   width: 160,
        //   child: ElevatedButton(
        //       onPressed: () {
        //         customdialog(context);
        //       },
        //       style: ElevatedButton.styleFrom(
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(15)),
        //           backgroundColor: UIColors.black,
        //           foregroundColor: UIColors.white),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(
        //             Icons.add,
        //             color: UIColors.white,
        //           ),
        //           Text(
        //             'New Chat',
        //             style: TextStyle(color: UIColors.white),
        //           )
        //         ],
        //       )),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,