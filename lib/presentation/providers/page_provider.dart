import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int _index = 0;

  set setIndex(int val) {
    _index = val;
    notifyListeners();
  }

  int get getIndex => _index;

  bool _isHover1 = false;
  bool _isHover2 = false;
  bool _isSelect1 = true;
  bool _isSelect2 = false;

  set setHover1(bool val) {
    _isHover1 = val;
    notifyListeners();
  }

  bool get getHover1 => _isHover1;

  set setHover2(bool val) {
    _isHover2 = val;
    notifyListeners();
  }

  bool get getHover2 => _isHover2;

  set setSelect1(bool val) {
    _isSelect1 = val;
    notifyListeners();
  }

  bool get getSelect1 => _isSelect1;

  set setSelect2(bool val) {
    _isSelect2 = val;
    notifyListeners();
  }

  bool get getSelect2 => _isSelect2;
}
