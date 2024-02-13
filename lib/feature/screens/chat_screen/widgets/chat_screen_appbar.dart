import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/constrains/widget/my_icon_button.dart';
import 'package:mangochatapp/feature/models/user_model.dart';

AppBar chatScreenAppBar(BuildContext context, {required UserModel user}) {
  var lastOnlineTime = TimeOfDay.fromDateTime(
          DateTime.fromMillisecondsSinceEpoch(user.lastOnline!))
      .format(context)
      .toString();
  return AppBar(
    backgroundColor: UIColors.greyShade200,
    toolbarHeight: 70,
    leading: MyIconButton(
        onTap: () {
          Navigator.pop(context);
        },
        icon: CupertinoIcons.back),
    title: Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: UIColors.greyShade500,
          backgroundImage:
              user.profilePic != null ? NetworkImage(user.profilePic!) : null,
        ),
        SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                user.name,
                style: TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.fade,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 3),
            Text(
              user.isOnline! ? 'online' : lastOnlineTime,
              style: TextStyle(
                  fontSize: 12,
                  color: user.isOnline! ? UIColors.green : UIColors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
    actions: [
      MyIconButton(onTap: () {}, icon: CupertinoIcons.phone, iconSize: 30),
      SizedBox(
        width: 10,
      ),
      // MyIconButton(
      //   onTap: () {},
      //   icon: CupertinoIcons.videocam,
      // ),
      SizedBox(
        width: 10,
      )
    ],
  );
}
