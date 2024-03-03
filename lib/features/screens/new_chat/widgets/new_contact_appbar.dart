import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';
import 'package:mangochatapp/constrains/widget/my_icon_button.dart';
import 'package:mangochatapp/features/state_manegment/new_contact_bloc/new_contact_bloc.dart';

AppBar newContactAppBar(BuildContext context) {
  return AppBar(
      backgroundColor: UIColors.primary,
      title: Center(
        child: Row(
          children: [
            // SizedBox(width: 10),
            MyIconButton(
                onTap: () {
                  Navigator.pop(context);
                },
                icon: CupertinoIcons.back,
                iconColor: UIColors.primary,
                iconSize: 30),
            Spacer(),
            Text(
              'My Contacts',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: UIColors.white,
                  fontSize: 18),
            ),
            Spacer()
          ],
        ),
      ),
      actions: [
        MyIconButton(
            onTap: () {
              context.read<NewContactBloc>().add(GetAllContact());
            },
            iconColor: UIColors.primary,
            icon: Icons.refresh_rounded,
            iconSize: 30),
        SizedBox(width: 20)
      ],
      leadingWidth: 0,
      leading: Text(''));
}
