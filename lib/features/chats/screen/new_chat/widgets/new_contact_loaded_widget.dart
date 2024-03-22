// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:mangochatapp/app/const/widget/my_chat_tile.dart';
import 'package:mangochatapp/app/const/widget/user_profile_img.dart';
import 'package:mangochatapp/features/chats/model/chat_screen_arg.dart';
import 'package:mangochatapp/features/chats/model/user_model.dart';
import 'package:mangochatapp/routes/page_routes.dart';

class NewContactLoadedWidget extends StatelessWidget {
  NewContactLoadedWidget({
    super.key,
    this.myUserModel,
  });

  final List<UserModel>? myUserModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: myUserModel!.length,
          itemBuilder: (context, index) {
            // var myConatctUser = myContactModel[index];
            var myConatctUser = myUserModel![index];
            return MyChatTile(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.chatScreen,
                    arguments: ChatScreenArguments(
                        toId: myConatctUser.id!, userModel: myConatctUser));
              },
              profile: NewContactProfileIcon(iconSize: 30, profilePic: null),
              userName: myConatctUser.name,
              phoneNumber: myConatctUser.mobileNumber!,
              lastMsg: null,
            );
          },
        ),
      ),
    );
  }
}
