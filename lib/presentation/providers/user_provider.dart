import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/data/models/user/user_model.dart';
import 'package:project/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  late UserService _userService;

  UserProvider() {
    _userService = UserService();
  }

  UserModel? _user;

  set setUser(UserModel user) => _user = user;
  void setUserNull() => _user = null;

  UserModel? get getUser => _user;

  Future<void> getById() async {
    await FirebaseAuth.instance.signInAnonymously();
    final pref = await SharedPreferences.getInstance();
    final user = await _userService.getById(userId: pref.getString("userId")!);
    setUser = user;
  }

  Future<UserModel> getDataById({required String userId}) async {
    final user = await _userService.getById(userId: userId);
    return user;
  }

  File? _img;
  set setImg(File val) {
    _img = val;
    notifyListeners();
  }

  File? get getImg => _img;

  String? _imgName;
  set setImgName(String val) => _imgName = val;
  String? get getImgName => _imgName;

  Future<bool> forgotPassword({
    required String username,
    required String password,
  }) async {
    return await _userService.checkData(
      username: username,
      password: password,
    );
  }
}
