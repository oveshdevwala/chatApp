import 'dart:async';

import 'package:flutter/material.dart';

class NewMsgSplashProvidewr extends ChangeNotifier {
  bool _showSplash = false;

  set showSplash(value) {
    showSplash = value;
    notifyListeners();
  }

  get showSplash => _showSplash;

  getSpalash() {
    _showSplash = true;
    notifyListeners();
  }

  offSplash() async {
    await Timer(Duration(milliseconds: 400), () {
      _showSplash = false;
    });
    notifyListeners();
  }
}
