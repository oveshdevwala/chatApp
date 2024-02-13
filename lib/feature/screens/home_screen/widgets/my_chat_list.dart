// ignore_for_file: must_be_immutable

import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/constrains/widget/my_chat_tile.dart';
import 'package:mangochatapp/constrains/widget/my_contact_tile_row.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/screens/chat_screen/chat_screen.dart';
import 'package:mangochatapp/feature/state_manegment/home_screen_chat_bloc/home_screen_chats_bloc.dart';

import '../../../models/user_model.dart';

class MyChatList extends StatelessWidget {
  const MyChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // FirebaseProvider.UpdateUserOnline();
    var mq = MediaQuery.of(context).size;
    return SafeArea(
        child: BlocBuilder<HomeScreenChatsBloc, HomeScreenChatsState>(
      builder: (context, state) {
        if (state is HomeScreenLoadingState) {
          return Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: mq.width * 0.6,
                      child: CardLoading(
                        height: 40,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(
                        width: mq.width * 0.2,
                        child: CardLoading(
                          height: 40,
                          borderRadius: BorderRadius.circular(12),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CardLoading(
                        borderRadius: BorderRadius.circular(12),
                        height: 0,
                        child: ListTile(),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        } else if (state is HomeScreenErrorState) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                CardLoading(
                  height: 40,
                  borderRadius: BorderRadius.circular(12),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: CardLoading(
                        borderRadius: BorderRadius.circular(12),
                        height: 0,
                        child: ListTile(
                          title: Text(state.erroMsg),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        } else if (state is HomeScreenLoadedState) {
          List<UserModel> myUserModel = [];
          for (int i = 0; i < state.getUsers.docs.length; i++) {
            UserModel user = UserModel.fromDoc(state.getUsers.docs[i].data());
            if (state.getUsers.docs[i].id != FirebaseProvider.userId &&
                user.lastMessage != null) {
              myUserModel.add(UserModel.fromDoc(state.getUsers.docs[i].data()));
            }
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: MyContactTileRow(title: 'Chats'),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: myUserModel.length,
                    itemBuilder: (context, index) {
                      var myConatctUser = myUserModel[index];
                      var count = FirebaseProvider.getUnreadCount(
                          toId: myConatctUser.id!);
                      var unReadCount = count == '0' ? 0 : count;

                      return MyChatTile(
                          onTap: () {
                            // problem
                            //  Navigator.pushNamed(context, AppRoutes.chatScreen);
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 2),
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        ChatScreen(
                                          userModel: myConatctUser,
                                          toId: myConatctUser.id!,
                                        )));
                          },
                          userName: myConatctUser.name,
                          profilePic: '',
                          lastMsg: myConatctUser.lastMessage!,
                          unReadMsg: unReadCount.toString(),
                          time: '2.02');
                    },
                  ),
                )
              ],
            ),
          );
        }
        return SizedBox();
      },
    ));
  }
}
// class MyChatList extends StatelessWidget {
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