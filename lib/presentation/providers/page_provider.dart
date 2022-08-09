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
  bool _isHover3 = false;
  bool _isHover4 = false;
  bool _isHover5 = false;
  bool _isHover6 = false;
  bool _isSelect1 = true;
  bool _isSelect2 = false;
  bool _isSelect3 = false;
  bool _isSelect4 = false;
  bool _isSelect5 = false;
  bool _isSelect6 = false;

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

  set setHover3(bool val) {
    _isHover3 = val;
    notifyListeners();
  }

  bool get getHover3 => _isHover3;
  set setHover4(bool val) {
    _isHover4 = val;
    notifyListeners();
  }

  bool get getHover4 => _isHover4;

  set setHover5(bool val) {
    _isHover5 = val;
    notifyListeners();
  }

  bool get getHover5 => _isHover5;

  set setHover6(bool val) {
    _isHover6 = val;
    notifyListeners();
  }

  bool get getHover6 => _isHover6;

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
  set setSelect3(bool val) {
    _isSelect3 = val;
    notifyListeners();
  }

  bool get getSelect3 => _isSelect3;

  set setSelect4(bool val) {
    _isSelect4 = val;
    notifyListeners();
  }

  bool get getSelect4 => _isSelect4;

  set setSelect5(bool val) {
    _isSelect5 = val;
    notifyListeners();
  }

  bool get getSelect5 => _isSelect5;

  set setSelect6(bool val) {
    _isSelect6 = val;
    notifyListeners();
  }

  bool get getSelect6 => _isSelect6;
}
