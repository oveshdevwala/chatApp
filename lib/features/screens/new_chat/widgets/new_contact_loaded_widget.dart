import 'package:flutter/cupertino.dart';
import 'package:mangochatapp/constrains/widget/my_chat_tile.dart';
import 'package:mangochatapp/constrains/widget/user_profile_img.dart';
import 'package:mangochatapp/features/chat/data/models/chat_screen_arg.dart';
import 'package:mangochatapp/features/models/user_model.dart';
import 'package:mangochatapp/routes/page_routes.dart';

class NewContactLoadedWidget extends StatelessWidget {
  const NewContactLoadedWidget({
    super.key,
    required this.myUserModel,
  });

  final List<UserModel> myUserModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: myUserModel.length,
          itemBuilder: (context, index) {
            var myConatctUser = myUserModel[index];
            return MyChatTile(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.chatScreen,
                    arguments: ChatScreenArguments(
                        toId: myConatctUser.id!, userModel: myConatctUser));
              },
              profile: NewContactProfileIcon(
                  iconSize: 30, profilePic: myConatctUser.profilePic),
              userName: myConatctUser.name,
              phoneNumber: myConatctUser.mobileNumber,
              lastMsg: null,
            );
          },
        ),
      ),
    );
  }
}

// MyChatTile(
//               onTap: () {
//                 Navigator.pushNamed(context, AppRoutes.chatScreen,
//                     arguments: ChatScreenArguments(
//                         toId: myConatctUser.id!, userModel: myConatctUser));
//               },
//               profile: NewContactProfileIcon(
//                   iconSize: 30, profilePic: myConatctUser.profilePic),
//               userName: myConatctUser.name,
//               phoneNumber: myConatctUser.mobileNumber,
//               lastMsg: null,
//             );