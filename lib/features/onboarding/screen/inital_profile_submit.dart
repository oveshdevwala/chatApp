// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mangochatapp/app/theme/colors_styles.dart';
import 'package:mangochatapp/app/const/widget/my_submit_elevated_button.dart';

class InitalProfileSubmit extends StatelessWidget {
   InitalProfileSubmit({super.key, required this.phoneNumber});
  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text('Profile Setup',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: UIColors.black,
              )),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Plese enter your name and an optional profile picture',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: UIColors.grey,
                )),
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              CircleAvatar(
                radius: 60,
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: UIColors.primary,
                  child: Icon(
                    Icons.brush,
                    color: UIColors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(17)),
                fillColor: UIColors.greyShade200,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                hintText: 'User Name',
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MySubmitElevatedButton(btName: 'Finish', onTap: () {}),
          ),
          SizedBox(height: 20)
        ],
      )),
    );
  }
}
