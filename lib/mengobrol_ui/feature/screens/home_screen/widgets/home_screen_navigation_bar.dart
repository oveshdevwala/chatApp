import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/home_screen/home_screen.dart';

class HomeScreenNavigationBar extends StatefulWidget {
  const HomeScreenNavigationBar({super.key});

  @override
  State<HomeScreenNavigationBar> createState() => _HomeScreenNavigationBarState();
}

class _HomeScreenNavigationBarState extends State<HomeScreenNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: selectednav,
        onTap: (value) {
          selectednav = value;
          setState(() {});
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              icon: Icon(
                CupertinoIcons.home,
                color: Colors.grey,
              ),
              label: ''),
          BottomNavigationBarItem(
              label: 'newChat',
              icon: InkWell(
                  onTap: () {
                    customdialog(context);
                    setState(() {});
                  },
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.add), Text('New Chat')],
                      )))),
          BottomNavigationBarItem(
              activeIcon: Icon(
                CupertinoIcons.person,
                color: Colors.black,
              ),
              icon: Icon(
                CupertinoIcons.person,
                color: Colors.grey,
              ),
              label: '')
        ]);
  }
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
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Icon(
                                Icons.message_outlined,
                                color: Colors.black,
                                size: 25,
                              ),
                            ),
                            title: Text(
                              'New Chat',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Send a message to your contact',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ),
                          Divider(
                              color: Colors.grey.withOpacity(0.3),
                              height: 1,
                              thickness: 1),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: ListTile(
                              leading: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Icon(
                                  ui_colors.assignment_ind_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                              title: Text(
                                'New Contact',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Add a contact to be able to send messages',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ),
                          Divider(
                              color: Colors.grey.withOpacity(0.3),
                              height: 1,
                              thickness: 1),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: ListTile(
                              leading: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Icon(
                                  Icons.group_outlined,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                              title: Text(
                                'New Community',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'Join the community around you',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          )
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
                              backgroundColor: ui_colors.dialogwhite),
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
}