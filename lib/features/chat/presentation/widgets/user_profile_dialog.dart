// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/constrains/widget/my_icon_button.dart';
import 'package:mangochatapp/constrains/widget/user_profile_img.dart';
import 'package:mangochatapp/features/models/user_model.dart';
import 'package:mangochatapp/features/state_manegment/user_profile_data_provider.dart';
import 'package:provider/provider.dart';

userProfileDialog({required BuildContext context, required UserModel user}) {
  showDialog(
      context: context,
      builder: (_) => Material(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            child: Container(
              decoration: BoxDecoration(
                  color: UIColors.greyShade200,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: MyIconButton(
                          iconSize: 50,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          icon: Icons.cancel_rounded),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          UserProfileIMG(userContact: user, radius: 60),
                          SizedBox(height: 10),
                          Text(user.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: UIColors.black)),
                          Text(user.mobileNumber!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: UIColors.black)),
                          SizedBox(height: 20),
                          CallCardContainer(),
                          SizedBox(height: 10),
                          NotificationStatusTile(toId: user.id!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
}

class NotificationStatusTile extends StatelessWidget {
  NotificationStatusTile({super.key, required this.toId});
  String toId;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileDataProvider>(
        builder: (contextb, provider, child) {
      return Container(
        decoration: BoxDecoration(
            color: UIColors.greyShade300,
            borderRadius: BorderRadius.circular(12)),
        child: SwitchListTile(
          value: provider.muteNotification!,
          onChanged: (value) {
            provider.muteNotification = value;
            context
                .read<UserProfileDataProvider>()
                .updateNotificationStatus(value: value, toId: toId);
          },
          title: Text(
            'Mute Notification',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: UIColors.primary),
          ),
          tileColor: UIColors.greyShade300,
          trackOutlineColor: MaterialStatePropertyAll(UIColors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(width: 2, color: UIColors.black)),
          inactiveTrackColor: UIColors.primary,
          inactiveThumbColor: UIColors.white,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          thumbIcon: MaterialStatePropertyAll(provider.muteNotification
              ? Icon(
                  Icons.done_outline_rounded,
                  color: UIColors.primary,
                )
              : Icon(
                  Icons.cancel_rounded,
                  color: UIColors.black,
                )),
          activeTrackColor: UIColors.primary,
          activeColor: UIColors.white,
        ),
      );
    });
  }
}

class CallCardContainer extends StatelessWidget {
  const CallCardContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: UIColors.primary, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                MyIconButton(
                    iconSize: 40,
                    onTap: () {},
                    icon: CupertinoIcons.phone,
                    iconColor: UIColors.primary),
                Text(
                  'Voice',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: UIColors.white),
                ),
              ],
            ),
            Column(
              children: [
                MyIconButton(
                    iconSize: 45,
                    onTap: () {},
                    icon: CupertinoIcons.videocam,
                    iconColor: UIColors.primary),
                Text(
                  'Video',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: UIColors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
