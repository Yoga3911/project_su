import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constants/fonts.dart';
import 'package:project/data/models/auth/register_model.dart';
import 'package:project/data/models/other/txtfield_model.dart';
import 'package:project/presentation/providers/auth_provider.dart';
import 'package:project/presentation/providers/textfield_provider.dart';
import 'package:project/routes/routes.dart';
import 'package:project/utils/hash.dart';
import 'package:project/utils/loading.dart';
import 'package:provider/provider.dart';

import 'custom_txt_field.dart';

class RegisterForm extends StatelessWidget {
  final TextFieldRegisterProvider txtField;
  final TextTheme text;
  const RegisterForm({
    super.key,
    required this.txtField,
    required this.text,
  });

  Future<bool> validasi(BuildContext context) async {
    if (txtField.getUsername.text.isEmpty ||
        txtField.getPassword1.text.isEmpty ||
        txtField.getPassword2.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Tidak boleh ada data yang kosong"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
      return false;
    } else if (txtField.getUsername.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Nama pengguna minimal 6 karakter"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
      return false;
    } else if (txtField.getUsername.text
            .contains(RegExp(r"(?=.*[a-zA-Z])(?=.*[0-9])\w+")) ==
        false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Nama pengguna harus kombinasi huruf dan angka"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
      return false;
    } else if (txtField.getPassword1.text.length < 8 ||
        txtField.getPassword2.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Kata sandi minimal 8 karakter"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
      return false;
    } else if (txtField.getPassword1.text != txtField.getPassword2.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Kata sandi dam Konfirmasi kata sandi tidak sama"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
        ),
      );
      return false;
    }
    return true;
  }

  void register(BuildContext context) {
    final date = DateTime.now().millisecondsSinceEpoch;
    context
        .read<AuthProvider>()
        .register(
          RegisterModel(
            username: txtField.getUsername.text,
            password: hashPass(txtField.getPassword1.text),
            desaId: context
                    .read<TextFieldRegisterProvider>()
                    .getDataDesa
                    .indexOf(txtField.getDesa.text) +
                1,
            image: "-",
            createdAt: date,
            updatedAt: date,
          ),
        )
        .then(
      (val) {
        Navigator.pop(context);
        if (!val) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text("Pengguna telah terdaftar, gunakan nama pengguna lain"),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 5),
            ),
          );
          return;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Akun berhasil didaftarkan"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 5),
          ),
        );
        Navigator.pushNamed(
          context,
          MyRoute.login,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<TextFieldModel> dataTxtField = [
      TextFieldModel(
        label: "Nama Pengguna",
        icon: Icons.person_rounded,
        isSecure: false,
        controller: txtField.getUsername,
        hint: "Minimal 6 karakter, kombinasi huruf dan angka",
      ),
      TextFieldModel(
        label: "Kata Sandi",
        icon: Icons.lock_rounded,
        isSecure: true,
        controller: txtField.getPassword1,
        hint: "Minimal 8 karakter",
      ),
      TextFieldModel(
        label: "Konfirmasi Kata Sandi",
        icon: Icons.lock_rounded,
        isSecure: true,
        controller: txtField.getPassword2,
        hint: "Minimal 8 karakter",
      ),
    ];
    final data = <CustomTextField>[
      for (int i = 0; i < dataTxtField.length; i++)
        CustomTextField(
          icon: dataTxtField[i].icon,
          label: dataTxtField[i].label,
          isSecure: dataTxtField[i].isSecure,
          controller: dataTxtField[i].controller,
          helper: dataTxtField[i].hint,
        ),
    ];
    return Column(
      children: [
        Text(
          "Daftarkan akun dan Nikmati kemudahan pekerjaan anda!",
          style: TextStyle(
            fontFamily: MyFont.semiBold,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 20.h),
        ...data,
        Hero(
          tag: "daftar",
          child: SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
              ),
              onPressed: () {
                primaryFocus?.unfocus();
                validasi(context).then(
                  (val) {
                    if (!val) {
                      return;
                    }
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => const CustomLoading(),
                    );
                    register(context);
                  },
                );
              },
              child: Text(
                "Daftar",
                style: text.bodyText1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
