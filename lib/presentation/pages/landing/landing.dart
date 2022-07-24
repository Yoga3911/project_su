import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/presentation/pages/auth/login.dart';
import 'package:project/presentation/pages/auth/register.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const routeName = "landing_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                context.goNamed(
                  LoginPage.routeName,
                  params: {"name": "ekoo"}
                );
              },
              child: const Text("Masuk"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.goNamed(RegisterPage.routeName);
              },
              child: const Text("Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
