// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/feature/models/user_model.dart';
import 'package:mangochatapp/feature/state_manegment/user_profile_data_provider.dart';

class MyProfilePictureUpdate extends StatelessWidget {
  MyProfilePictureUpdate({
    super.key,
    required this.user,
    required this.provider,
  });

  final UserModel user;
  CurrentProfilePictureProvider provider;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(200),
        child: provider.cropedFile != null
            ? CircleAvatar(
                radius: 70,
                backgroundImage: FileImage(File(provider.cropedFile!.path)))
            : user.profilePic != null
                ? CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(user.profilePic!),
                    backgroundColor: UIColors.white)
                : CircleAvatar(
                    radius: 70,
                    backgroundColor: UIColors.greyShade300,
                    child: FittedBox(
                      child: Icon(
                        CupertinoIcons.person_alt_circle,
                        color: UIColors.black26,
                        size: MediaQuery.of(context).size.width,
                      ),
                    )));
  }
}
