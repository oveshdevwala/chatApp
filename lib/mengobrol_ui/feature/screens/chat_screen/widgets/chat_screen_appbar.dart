import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar chatScreenAppBar(BuildContext context, {required image, required name}) {
  return AppBar(
    backgroundColor: Colors.grey.shade200,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.black,
      ),
    ),
    title: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(image),
              backgroundColor: Colors.yellowAccent,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.fade,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Online',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        )),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.video_camera,
          color: Colors.black,
          size: 35,
        ),
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.phone,
          color: Colors.black,
          size: 25,
        ),
      ),
      SizedBox(
        width: 10,
      )
    ],
  );
}
