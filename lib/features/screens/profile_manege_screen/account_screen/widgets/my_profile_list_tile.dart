// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/features/screens/profile_manege_screen/comming_soon.dart';

class MyProfileListTile extends StatelessWidget {
  MyProfileListTile({
    super.key,
    this.leadingIcon,
    required this.title,
    this.leadingIconSize = 35,
    this.subTitle,
    this.sideBorder = false,
    this.trailingIcon,
    this.profileImg,
    this.onTap,
    this.trailingIconSize = 35,
  });

  String title;
  String? subTitle;
  IconData? leadingIcon;
  double leadingIconSize;
  IconData? trailingIcon;
  double trailingIconSize;
  bool sideBorder;
  Widget? profileImg;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      child: ListTile(
        onTap: onTap ??
            () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommingSoonScreen(),
                  ));
            },
        tileColor: UIColors.greyShade200,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side:
              sideBorder ? BorderSide(color: UIColors.black) : BorderSide.none,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: UIColors.black, fontSize: 17),
        ),
        subtitle: subTitle != null
            ? Text(
                subTitle!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: UIColors.black38,
                    fontSize: 13),
              )
            : null,
        leading: profileImg != null
            ? profileImg
            : Icon(
                leadingIcon,
                size: leadingIconSize,
                color: UIColors.primary,
              ),
        trailing: trailingIcon != null
            ? CircleAvatar(
                radius: 18,
                backgroundColor: UIColors.primary,
                child: Icon(
                  trailingIcon,
                  size: trailingIconSize,
                  color: UIColors.white,
                ),
              )
            : null,
      ),
    );
  }
}
