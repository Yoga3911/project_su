import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int _index = 0;

  set setIndex(int val) {
    _index = val;
    notifyListeners();
  }

  int get getIndex => _index;
}
