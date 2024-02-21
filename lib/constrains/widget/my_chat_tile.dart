// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';

class MyChatTile extends StatelessWidget {
  MyChatTile({
    super.key,
    required this.userName,
    this.profilePic,
    required this.lastMsg,
    this.unReadMsg,
    this.phoneNumber,
    this.profile,
    // this.time,
    required this.onTap,
  });
  String userName;
  Widget? lastMsg;
  String? phoneNumber;
  String? profilePic;
  Widget? unReadMsg;
  // String? time;
  VoidCallback onTap;
  Widget? profile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          // side: BorderSide(color: UIColors.blueShade300, width: 2)
        ),
        onTap: onTap,
        tileColor: UIColors.greyShade100,
        leading: profile,
        title: Text(
          userName,
          style: TextStyle(fontWeight: FontWeight.bold, color: UIColors.black),
        ),
        subtitle: lastMsg ??
            Text(
              phoneNumber!,
              style: TextStyle(color: UIColors.black54),
            ),
        trailing: unReadMsg ?? null,
      ),
    );
  }
}
