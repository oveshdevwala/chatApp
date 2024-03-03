import 'package:flutter/material.dart';

class PhoneNumberProvider extends ChangeNotifier {
  TextEditingController numberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  get numberControllerValue => numberController;
  set numberControllerValue(value) {
    numberController.text = value;
    notifyListeners();
  }
  get userNameControllerValue => userNameController;
  set userNameControllerVlaue(value) {
    userNameController.text = value;
    notifyListeners();
  }
  get emailControllerValue => emailController;
  set emailControllerVlaue(value) {
    userNameController.text = value;
    notifyListeners();
  }

  
}
