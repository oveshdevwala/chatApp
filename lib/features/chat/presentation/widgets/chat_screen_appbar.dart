// ignore_for_file: must_be_immutable

import 'package:card_loading/card_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/features/app/global/date/time_formater.dart';
import 'package:mangochatapp/constrains/widget/user_profile_img.dart';
import 'package:mangochatapp/data/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/features/models/user_model.dart';
import 'package:mangochatapp/features/chat/presentation/widgets/user_profile_dialog.dart';

chatScreenAppBar(BuildContext contextb, {required String toId}) {
  return AppBar(
    backgroundColor: UIColors.primary,
    toolbarHeight: 60,
    surfaceTintColor: UIColors.primary,
    leading: Text(''),
    leadingWidth: 0,
    elevation: 30,
    title: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseProvider.getUserProfileData(toId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return lodingStateTitle(context);
          }
          if (snapshot.hasData) {
            UserModel user = UserModel.fromDoc(snapshot.data!.data()!);
            return InkWell(
                onTap: () {
                  userProfileDialog(context: context, user: user);
                },
                child: loadedStateTitle(context, user));
          }
          return SizedBox();
        }),
    actions: [
      StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: FirebaseProvider.getUserProfileData(toId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.videocam_circle,
                    color: UIColors.white,
                    size: 40,
                  ));
            }
            if (snapshot.hasData || snapshot.data != null) {
              UserModel userModel = UserModel.fromDoc(snapshot.data!.data()!);
              return IconButton(
                  onPressed: () {
                    FirebaseProvider.makeCall(
                        receiverUserModel: userModel, context: context);
                  },
                  icon: Icon(
                    CupertinoIcons.videocam_circle,
                    color: UIColors.white,
                    size: 40,
                  ));
            }
            return SizedBox();
          }),
      SizedBox(
        width: 20,
      ),
    ],
  ); //
}

Row loadedStateTitle(BuildContext context, UserModel user) {
  return Row(
    children: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: IconButton.styleFrom(
          padding: EdgeInsets.all(4),
        ),
        icon: Row(
          children: [
            Icon(
              CupertinoIcons.back,
              color: UIColors.white,
              size: 30,
            ),
            UserProfileIMG(userContact: user, iconSize: 25),
          ],
        ),
      ),
      SizedBox(width: 10),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              user.name,
              maxLines: 1,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.fade,
                color: UIColors.white,
              ),
            ),
          ),
          SizedBox(height: 3),
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: UIColors.greyShade200,
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              user.isOnline!
                  ? 'Online'
                  : getFormatedTime(user.lastOnline!.toString(), context),
              style: TextStyle(
                  fontSize: 11,
                  color: UIColors.primary,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    ],
  );
}

SizedBox lodingStateTitle(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: CardLoading(
      height: 50,
      borderRadius: BorderRadius.circular(10),
      cardLoadingTheme: CardLoadingTheme(
          colorOne: UIColors.greyShade50,
          colorTwo: UIColors.greyShade100.withOpacity(0.4)),
    ),
  );
}
