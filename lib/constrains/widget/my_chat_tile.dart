// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';

class MyChatTile extends StatelessWidget {
  MyChatTile({
    super.key,
    required this.userName,
    required this.profilePic,
    required this.lastMsg,
    required this.unReadMsg,
    required this.time,
    required this.onTap,
  });
  String userName;
  String lastMsg;
  String? profilePic;
  String unReadMsg;
  String time;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 0,
      ),
      minVerticalPadding: 10,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.yellow,
        // backgroundImage: NetworkImage(profilePic!),
      ),
      title: Text(
        userName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        lastMsg,
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 12.5,
            color: Colors.grey,
            fontWeight: FontWeight.w500),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time),
          SizedBox(height: 5),
          CircleAvatar(
            radius: unReadMsg == '' ? 0 : 10,
            child: Text(
              unReadMsg,
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: UIColors.unreadcirclecolor,
          )
        ],
      ),
    );
  }
}
