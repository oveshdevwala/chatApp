import 'package:flutter/material.dart';
import 'package:mangochatapp/routes/page_routes.dart';
import 'package:mangochatapp/features/app/theme/colors_styles.dart';

customdialog(context) {
  showGeneralDialog(
    barrierDismissible: false,
    barrierLabel: '',
    context: context,
    pageBuilder: (_, __, ___) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: AnimatedContainer(
              curve: Curves.bounceIn,
              duration: Duration(seconds: 3),
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          myCutomListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, AppRoutes.newChatScreen);
                              },
                              title: 'New Chat',
                              subTitle: 'Send a message to Your contact',
                              icon: Icons.message_outlined),
                          Divider(
                              color: Colors.grey.withOpacity(0.3),
                              height: 1,
                              thickness: 1),
                          myCutomListTile(
                              onTap: () {},
                              title: 'New Contact',
                              subTitle:
                                  'Add a contact to be able to send messages',
                              icon: IconDataList.assignment_ind_outlined),
                          Divider(
                              color: Colors.grey.withOpacity(0.3),
                              height: 1,
                              thickness: 1),
                          myCutomListTile(
                              onTap: () {},
                              title: 'New Community',
                              subTitle: 'Join the community around you',
                              icon: Icons.group_outlined),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.all(10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: UIColors.dialogwhite),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 5),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Widget myCutomListTile(
    {required title,
    required String subTitle,
    required IconData icon,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: ListTile(
      leading: Container(
        child: Icon(
          icon,
          color: Colors.black,
          size: 25,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(fontSize: 15, color: Colors.grey),
      ),
    ),
  );
}
