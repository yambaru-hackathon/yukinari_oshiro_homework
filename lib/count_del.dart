import 'package:flutter/material.dart';

class CountDel extends ChangeNotifier{
  int counter = 0;

  void decrementCounter() {
    counter--;
    notifyListeners();
  }
}
