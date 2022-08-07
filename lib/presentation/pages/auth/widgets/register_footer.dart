import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/constants/color.dart';
import 'package:project/presentation/pages/auth/login.dart';

class RegisterFooter extends StatelessWidget {
  final TextTheme text;
  const RegisterFooter({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Sudah punya akun? ",
              style: text.headline5,
            ),
            TextSpan(
              text: "Masuk disini",
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.replaceNamed(LoginPage.routeName),
              style: const TextStyle(
                fontSize: 14,
                color: MyColor.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
