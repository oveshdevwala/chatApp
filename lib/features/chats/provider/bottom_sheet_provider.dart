import 'package:flutter/material.dart';

class BottomSheetProvider extends ChangeNotifier {
  bool _showBottomSheet = false;

  bool get showBottomSheet => _showBottomSheet;
  set showBottomSheet(bool value) {
    _showBottomSheet = value;
    notifyListeners();
  }
  
}
