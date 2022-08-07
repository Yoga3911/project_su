import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/data/models/auth/login_model.dart';
import 'package:project/data/models/auth/register_model.dart';
import 'package:project/data/models/user/user_model.dart';
import 'package:project/services/auth_service.dart';
import 'package:project/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  late EmailService _emailService;
  late UserService _userService;

  static final AuthProvider _single = AuthProvider._();

  AuthProvider._() {
    _emailService = EmailService();
    _userService = UserService();
  }

  factory AuthProvider() => _single;

  Future<bool> register(RegisterModel registerModel) async {
    final isExist =
        await _userService.getByUsername(username: registerModel.username);
    if (isExist) {
      return false;
    }

    await _emailService.signUp(registerModel: registerModel);
    return true;
  }

  Future<dynamic> login(LoginModel loginModel) async {
    final data = await _emailService.signIn(loginModel: loginModel);
    if (data.runtimeType == String) {
      return data;
    }
    final pref = await SharedPreferences.getInstance();
    pref.setString("userId", (data as UserModel).userId);
    pref.setString("loginToken", (data).loginToken);
    pref.setString("userData", jsonEncode(data));
    return data;
  }

  Future<bool> logout() async {
    return await _emailService.signOut();
  }
}
