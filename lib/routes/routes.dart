import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/pages/auth/login.dart';
import '../presentation/pages/auth/register.dart';
import '../presentation/pages/landing/landing.dart';
import '../presentation/widgets/main.dart';
import '../utils/error_page.dart';

class MyRoute {
  static final _single = MyRoute._();
  MyRoute._();
  factory MyRoute() => _single;
  
  static const routeName = "root";

  //! ROOT
  static const root = "/";

  //! AUTH
  static const landing = "/auth";
  static const login = "login/:name";
  static const register = "register";

  //! MAIN
  static const main = "/main";

  late final data = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: root,
    routerNeglect: true,
    routes: <GoRoute>[
      GoRoute(
        path: root,
        name: routeName,
        redirect: (state) => state.namedLocation(
          LandingPage.routeName,
        ),
      ),
      GoRoute(
        path: landing,
        name: LandingPage.routeName,
        pageBuilder: (_, state) => MaterialPage(
          key: state.pageKey,
          child: const LandingPage(),
        ),
        routes: [
          GoRoute(
            path: login,
            name: LoginPage.routeName,
            pageBuilder: (_, state) => CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: LoginPage(
                user: state.params["name"]?? "NO DATA",
              ),
            ),
          ),
          GoRoute(
            path: register,
            name: RegisterPage.routeName,
            pageBuilder: (_, state) => CustomTransitionPage(
              key: state.pageKey,
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: const RegisterPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: main,
        name: MainPage.routeName,
        pageBuilder: (_, state) => CustomTransitionPage(
          key: state.pageKey,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
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
