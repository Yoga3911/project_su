import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String name;
  const LoginPage({
    super.key,
    required this.name,
  });

  static const routeName = "login_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(name),
      ),
    );
  }
}
