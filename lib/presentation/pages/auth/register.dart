import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const routeName = "register_page";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Register!"),
      ),
    );
  }
}
