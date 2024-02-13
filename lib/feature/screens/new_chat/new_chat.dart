import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/constrains/widget/my_chat_tile.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:mangochatapp/feature/screens/chat_screen/chat_screen.dart';
import 'package:mangochatapp/feature/state_manegment/new_chat_bloc/new_chat_bloc.dart';

import '../../../constrains/widget/my_contact_tile_row.dart';

class NewChatScreen extends StatelessWidget {
  const NewChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    context.read<NewChatBloc>().add(GetAllUsersEvent());
    return Scaffold(
      body: SafeArea(child: BlocBuilder<NewChatBloc, NewChatState>(
        builder: (context, state) {
          if (state is NewChatLoadingState) {
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
          } else if (state is NewChatErrorState) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  CardLoading(
                    height: 40,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // MyContactTileRow(title: 'My Contact'),
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
                            title: Text(state.errorMsg),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          } else if (state is NewChatLoadedState) {
            List<UserModel> myUserModel = [];
            for (int i = 0; i < state.getUsers.docs.length; i++) {
              if (state.getUsers.docs[i].id != FirebaseProvider.userId) {
                myUserModel
                    .add(UserModel.fromDoc(state.getUsers.docs[i].data()));
              }
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: MyContactTileRow(title: 'My Contact'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: myUserModel.length,
                      itemBuilder: (context, index) {
                        var myConatctUser = myUserModel[index];
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
                            lastMsg: myConatctUser.mobileNumber ?? 'null',
                            unReadMsg: 'unReadMsg',
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
      )),
    );
  }
}
