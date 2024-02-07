import 'package:flutter/material.dart';
import 'package:mangochatapp/mengobrol_ui/feature/screens/home_screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mengobrol_uiapp());
  }
}
