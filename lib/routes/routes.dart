import 'package:flutter/material.dart';
import 'package:project/presentation/pages/auth/login.dart';
import 'package:project/presentation/pages/auth/register.dart';
import 'package:project/presentation/widgets/main.dart';

class MyRoute {
  MyRoute._();

  static const main = "/main";
  static const login = "/login";
  static const register = "/register";

  static final data = <String, WidgetBuilder>{
    main: (_) => const MainPage(),
    login: (_) => const LoginPage(),
    register: (_) => const RegisterPage(),
  };
}
