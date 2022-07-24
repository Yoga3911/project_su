import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/presentation/pages/auth/login.dart';
import 'package:project/presentation/pages/auth/register.dart';
import 'package:project/presentation/widgets/main.dart';
import 'package:project/utils/error_page.dart';

class MyRoute {
  static final _single = MyRoute._();
  MyRoute._();
  factory MyRoute() => _single;

  static const routeName = "root";

  static const root = "/";
  static const main = "/main";
  static const login = "/auth/login";
  static const register = "/auth/register";

  late final data = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: root,
    routerNeglect: true,
    routes: <GoRoute>[
      GoRoute(
        path: root,
        name: routeName,
        redirect: (state) => state.namedLocation(
          LoginPage.routeName,
        ),
      ),
      GoRoute(
        path: login,
        name: LoginPage.routeName,
        pageBuilder: (_, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: register,
        name: RegisterPage.routeName,
        pageBuilder: (_, state) => MaterialPage(
          key: state.pageKey,
          child: const RegisterPage(),
        ),
      ),
      GoRoute(
        path: main,
        name: MainPage.routeName,
        pageBuilder: (_, state) => MaterialPage(
          key: state.pageKey,
          child: const MainPage(),
        ),
      ),
    ],
    errorPageBuilder: (_, state) => MaterialPage(
      key: state.pageKey,
      child: ErrorPage(
        exception: state.error!,
      ),
    ),
  );
}
