import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/user_model.dart';

class LoginPage extends StatelessWidget {
  final UserModel user;
  const LoginPage({
    super.key,
    required this.user,
  });

  static const routeName = "login_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          user.name,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
