// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';
import 'package:mangochatapp/features/chats/model/user_model.dart';

class UserProfileIMG extends StatelessWidget {
  UserProfileIMG({
    super.key,
    required this.userContact,
    this.iconSize = 28,
    this.radius = 28,
  });

  final UserModel? userContact;
  double iconSize;
  double radius;
  @override
  Widget build(BuildContext context) {
    return userContact!.isOnline!
        ? onlineUserProfile(context)
        : myProfilePicuture(context);
  }

  Widget onlineUserProfile(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: UIColors.greyShade300,
              boxShadow: [
                BoxShadow(
                    color: UIColors.greyShade200,
                    blurRadius: 5,
                    spreadRadius: 1)
              ],
              shape: BoxShape.circle),
          child: myProfilePicuture(context)),
    );
  }

  Widget myProfilePicuture(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: UIColors.white,
      backgroundImage: userContact!.profilePic != null
          ? NetworkImage(userContact!.profilePic!)
          : null,
      child: userContact!.profilePic == null
          ? FittedBox(
              fit: BoxFit.cover,
              child: Icon(
                CupertinoIcons.person_alt_circle,
                color: UIColors.primary,
                size: MediaQuery.of(context).size.width,
              ))
          : null,
    );
  }
}

class NewContactProfileIcon extends StatelessWidget {
  NewContactProfileIcon(
      {super.key, required this.iconSize, required this.profilePic});
  double iconSize;
  String? profilePic;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: iconSize,
      backgroundColor: UIColors.white,
      backgroundImage: profilePic != null ? NetworkImage(profilePic!) : null,
      child: profilePic == null || profilePic == ''
          ? FittedBox(
              fit: BoxFit.cover,
              child: Icon(
                CupertinoIcons.person_alt_circle,
                color: UIColors.primary,
                size: MediaQuery.of(context).size.width,
              ))
          : null,
    );
  }
}
