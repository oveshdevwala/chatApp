import 'package:flutter/cupertino.dart';
import 'package:mangochatapp/constrains/widget/my_chat_tile.dart';
import 'package:mangochatapp/constrains/widget/user_profile_img.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:mangochatapp/feature/screens/chat_screen/chat_screen.dart';

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
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(seconds: 2),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            ChatScreen(
                              userModel: myConatctUser,
                              toId: myConatctUser.id!,
                            )));
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
