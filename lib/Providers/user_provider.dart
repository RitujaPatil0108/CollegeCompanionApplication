// TODO Implement this library.import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late String rollNumber;

  void setRollNumber(String rollNumber) {
    this.rollNumber = rollNumber;
    notifyListeners();
  }
}
