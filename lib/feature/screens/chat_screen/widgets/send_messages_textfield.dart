// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mangochatapp/constrains/colors.dart';
import 'package:mangochatapp/datasource/remote/firebase/firebase_provider.dart';
import 'package:mangochatapp/feature/models/user_model.dart';

class SendMessageBar extends StatelessWidget {
  SendMessageBar({super.key, required this.userModel});
  UserModel userModel;
  var messageContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: UIColors.primary,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      var msg = messageContoller.text;
                      if (msg.isNotEmpty) {
                        FirebaseProvider.sendTextMessage(
                            message: messageContoller.text.toString(),
                            userModel: userModel);
                      }
                    },
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.all(0),
                    ),
                    icon: Icon(
                      CupertinoIcons.add_circled,
                      size: 40,
                      color: UIColors.white,
                    ),
                  )),
              SizedBox(width: 5),
              Expanded(
                flex: 6,
                child: TextField(
                    controller: messageContoller,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async {
                            var msg = messageContoller.text;
                            if (msg.isNotEmpty) {
                              FirebaseProvider.sendTextMessage(
                                  message: messageContoller.text.toString(),
                                  userModel: userModel);
                            }
                          },
                          icon: Icon(Icons.send_rounded,
                              color: UIColors.primary, size: 30),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        fillColor: UIColors.greyShade100,
                        filled: true,
                        hintText: 'Type Message',
                        hintStyle: TextStyle(color: UIColors.primary))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class SendMessageBar extends StatelessWidget {
//   const SendMessageBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
      
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.add), label: 'addFunction'),
//           BottomNavigationBarItem(

//             label: 'textField',
//             icon: TextField(
//                 decoration: InputDecoration(
//                     contentPadding:
//                         EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25),
//                         borderSide: BorderSide.none),
//                     fillColor: Color(0xfff7f7f7),
//                     filled: true,
//                     hintText: 'New Chat',
//                     hintStyle: TextStyle(color: Colors.grey))),
//           ),
//           BottomNavigationBarItem(
//               label: 'mic',
//               icon: IconButton(
//                   onPressed: () {},
//                   icon: Icon(CupertinoIcons.mic,
//                       color: Colors.black87, size: 22)))
//         ]);
//   }
// }
