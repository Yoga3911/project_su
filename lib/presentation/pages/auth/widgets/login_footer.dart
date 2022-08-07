import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/constants/color.dart';
import 'package:project/presentation/pages/auth/register.dart';

class LoginFooter extends StatelessWidget {
  final TextTheme text;
  const LoginFooter({
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
              text: "Belum punya akun? ",
              style: text.headline5,
            ),
            TextSpan(
              text: "Daftar disini",
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.replaceNamed(RegisterPage.routeName),
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
