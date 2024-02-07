import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/chat_screen/chatpage.dart';
import 'package:mangochatapp/mengobrol_ui/database.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/home_screen/widgets/home_screen_appbar.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/home_screen/widgets/home_screen_navigation_bar.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/home_screen/widgets/my_status_row.dart';

class ui_colors {
  static const IconData assignment_ind_outlined =
      IconData(0xee96, fontFamily: 'MaterialIcons');

  static Color homebgcolor = Color(0xffffffff);
  static Color dialogwhite = Color(0xffeeeeee);
  static Color unreadcirclecolor = Color(0xfffdc604);

  static const _kFontFam = 'MyFlutterApp';

  static const String? _kFontPkg = null;
  static const IconData double_tick =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

var selectednav = 0;

class mengobrol_uiapp extends StatefulWidget {
  mengobrol_uiapp({super.key});

  @override
  State<mengobrol_uiapp> createState() => _mengobrol_uiappState();
}

class _mengobrol_uiappState extends State<mengobrol_uiapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ui_colors.homebgcolor,
      appBar: HomePageAppBAr(),
      bottomNavigationBar: HomeScreenNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyStatusRow(),
            Column(
              children: [
                HomePageContactList(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  HomePageContactList() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Chats",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 50,
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(bottom: 15),
                  child: Stack(children: [
                    Text(
                      '...',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ]),
                )
              ],
            ),
            ListView.builder(
              itemCount: contact_data.length,
              itemExtent: 80,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(seconds: 2),
                            pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                chat_ui(
                                    cindex: index,
                                    name: contact_data[index]['name'],
                                    image: contact_data[index]['profileimage']),
                          ));
                    },
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      minVerticalPadding: 10,
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.yellow,
                        backgroundImage:
                            AssetImage(contact_data[index]['profileimage']),
                      ),
                      title: Text(
                        contact_data[index]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        contact_data[index]['message'],
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12.5,
                            color: contact_data[index]['readUndread'] == ''
                                ? Colors.black54
                                : Colors.black,
                            fontWeight: contact_data[index]['readUndread'] == ''
                                ? FontWeight.normal
                                : FontWeight.w500),
                      ),
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('02.11'),
                          SizedBox(height: 5),
                          CircleAvatar(
                            radius: contact_data[index]['readUndread'] == ''
                                ? 0
                                : 10,
                            child: Text(
                              contact_data[index]['readUndread'],
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: ui_colors.unreadcirclecolor,
                          )
                        ],
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Container profilecontainer_listview() {
    return Container(
      height: 75,
      width: 75,
      margin: EdgeInsets.only(),
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
    );
  }
}
