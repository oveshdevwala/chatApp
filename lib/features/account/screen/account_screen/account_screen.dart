// ignore_for_file: must_be_immutable

import 'package:card_loading/card_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';
import 'package:mangochatapp/app/const/widget/user_profile_img.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/features/chats/model/user_model.dart';
import 'package:mangochatapp/features/chats/screen/new_chat/new_chat.dart';
import 'package:mangochatapp/features/account/screen/account_screen/widgets/MyLogoutButton.dart';
import 'package:mangochatapp/features/account/screen/my_account_screen/my_account_screen.dart';

import 'widgets/my_profile_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    // var mqH = mq.height;
    // var mqW = mq.width;
    return Scaffold(
        backgroundColor: UIColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseProvider.getUserProfileData(
                      FirebaseProvider.userId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        height: 100,
                        width: mq.width,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: UIColors.white,
                            ),
                            Text(
                              '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: UIColors.black,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Container(
                        height: 260,
                        width: mq.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CardLoading(
                              height: 200,
                              child: CircleAvatar(
                                radius: 50,
                              ),
                            ),
                            Text(
                              'User Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: UIColors.white,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: UIColors.primary,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30)),
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      UserModel userModel =
                          UserModel.fromDoc(snapshot.data!.data()!);
                      return Container(
                        // height: 100,
                        width: mq.width,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            NewContactProfileIcon(
                                iconSize: 55, profilePic: userModel.profilePic),
                            Text(
                              userModel.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: UIColors.black,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container(
                      height: 100,
                      width: mq.width,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: UIColors.white,
                          ),
                          Text(
                            'Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: UIColors.black,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    );
                  }),
              Container(
                child: Column(
                  children: [
                    MyProfileListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyAccountScreen()));
                        },
                        leadingIcon: CupertinoIcons.profile_circled,
                        title: "My Account",
                        subTitle: 'Email, Name, Profile Pic',
                        trailingIcon: Icons.chevron_right_rounded),
                    MyProfileListTile(
                        leadingIcon: CupertinoIcons.settings_solid,
                        title: "Setting",
                        subTitle: 'Privacy, Chat, Status',
                        trailingIcon: Icons.chevron_right_rounded),
                    MyProfileListTile(
                        leadingIcon: CupertinoIcons.archivebox,
                        title: "Archived",
                        subTitle: 'Hided Contacts',
                        trailingIcon: Icons.chevron_right_rounded),
                    MyProfileListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewChatScreen()));
                        },
                        leadingIcon: CupertinoIcons.person_add,
                        title: "New Chat",
                        subTitle: 'Find Number User',
                        trailingIcon: Icons.chevron_right_rounded),
                    MyProfileListTile(
                        leadingIcon: CupertinoIcons.bell,
                        title: "Notification",
                        subTitle: 'Message, Group, Call',
                        trailingIcon: Icons.chevron_right_rounded),
                    MyProfileListTile(
                        leadingIcon: Icons.info_outline_rounded,
                        title: "Contact Us",
                        subTitle: 'Suggestions & Feedback',
                        trailingIcon: Icons.chevron_right_rounded),
                    MyLogoutButtonTile()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
