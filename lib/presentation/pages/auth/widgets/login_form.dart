import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constants/fonts.dart';
import 'package:project/data/models/auth/login_model.dart';
import 'package:project/presentation/providers/auth_provider.dart';
import 'package:project/presentation/providers/textfield_provider.dart';
import 'package:project/presentation/providers/user_provider.dart';
import 'package:project/routes/routes.dart';
import 'package:project/utils/loading.dart';
import 'package:provider/provider.dart';

import 'custom_txt_field.dart';

class LoginForm extends StatelessWidget {
  final TextFieldLoginProvider txtField;
  final TextTheme text;
  const LoginForm({
    super.key,
    required this.txtField,
    required this.text,
  });

  void login(BuildContext context) {
    context
        .read<AuthProvider>()
        .login(
          LoginModel(
            username: txtField.getUsername.text,
            password: txtField.getPassword.text,
          ),
        )
        .then(
      (value) {
        Navigator.pop(context);
        if (value.runtimeType == String) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(value),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5),
            ),
          );
          return;
        }

        context.read<UserProvider>().setUser = value;
        Navigator.pushNamedAndRemoveUntil(
          context,
          MyRoute.main,
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Selamat datang kembali, senang bisa melihatmu lagi!",
          style: TextStyle(
            fontFamily: MyFont.semiBold,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          icon: Icons.person_rounded,
          label: "Nama Pengguna",
          isSecure: false,
          controller: txtField.getUsername,
          helper: null,
        ),
        CustomTextField(
          icon: Icons.lock_rounded,
          label: "Kata Sandi",
          isSecure: true,
          controller: txtField.getPassword,
          helper: null,
        ),
        SizedBox(height: 15.h),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              // showDialog(
              //   barrierDismissible: false,
              //   context: context,
              //   builder: (_) => ForgotPasswordDialog(
              //     txtField: txtField,
              //   ),
              // );
            },
            child: Text(
              "Lupa kata sandi?",
              style: text.headline5,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Hero(
          tag: "masuk",
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
              ),
              onPressed: () {
                primaryFocus?.unfocus();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const CustomLoading(),
                );
                login(context);
              },
              child: Text(
                "Masuk",
                style: text.bodyText1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
