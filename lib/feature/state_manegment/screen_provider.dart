import 'package:flutter/material.dart';

class ScreenProvider extends ChangeNotifier {
  int _screenIndex = 0;

  get screenIndex => _screenIndex;
  set screenIndex(value) {
    _screenIndex = value;
    notifyListeners();
  }
}
