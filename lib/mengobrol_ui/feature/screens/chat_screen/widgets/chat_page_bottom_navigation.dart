// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPageBottomNavigation extends StatelessWidget {
  const ChatPageBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      surfaceTintColor: Colors.grey.shade500,
      height: 90,
      child: Row(
        children: [
          Expanded(flex: 1, child: Icon(Icons.add)),
          Expanded(
            flex: 6,
            child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: 'New Chat',
                    hintStyle: TextStyle(color: Colors.black))),
          ),
          Expanded(
              flex: 1,
              child: Icon(CupertinoIcons.mic, color: Colors.black87, size: 22)),
        ],
      ),
    );
  }
}

// class ChatPageBottomNavigation extends StatelessWidget {
//   const ChatPageBottomNavigation({
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
