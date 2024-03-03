import 'package:flutter/material.dart';

class ScreenProvider extends ChangeNotifier {
  int _screenIndex = 0;

  get screenIndex => _screenIndex;
  set screenIndex(value) {
    _screenIndex = value;
    notifyListeners();
  }

  // get screenTitle => _screenTitle;
  // set screenTitle(value) {
  //   _screenTitle = value;
  //   notifyListeners();
  }

  // var _screenTitle;
  // appbarTextProvider() {
  //   if (_screenIndex == 0) {
      
  //     _screenTitle = 'Chats';
  //     notifyListeners();
  //   } else if (_screenIndex == 1) {
  //     _screenTitle = 'Status';
  //     notifyListeners();
  //   } else if (_screenIndex == 2) {
  //     _screenTitle = 'Calls';
  //     notifyListeners();
  //   } else {
  //     _screenTitle = "Account";
  //     notifyListeners();
  //   }
  

